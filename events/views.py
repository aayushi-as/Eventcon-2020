from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.contrib import messages
from django.contrib.auth.models import User,auth
from django.db import connection
from .models import Student,Cultural,Sports,event,Dept,Departmental

global studentID

global authUserName 

def getAuthUserName():
    return globals()['authUserName']

def setAuthUserName (name):
    globals()['authUserName'] = name

def getStudentId():
    return globals()['studentID']

def setStudentId(id):
    globals()['studentID'] = id
    
setStudentId(-1)

# Create your views here.
def home(request):
    return render(request,'home.html')

def about(request):
    return render(request,'about.html')

def sports(request):
    sport = Sports.objects.all()
    return render(request,'sports.html',{'sport':sport})

def clubs(request):
    return render(request,'clubs.html')

def cultural(request):
    event_list2 = Cultural.objects.all()
    return render(request,'cultural.html',{'event_list2':event_list2})

def department(request):
    dept_names = Dept.objects.all()
    # dept_events = Departmental.objects.all()
    return render(request,'department.html',{'dept_names':dept_names})

def equinox1(request):
    #dept_events = Departmental.objects.all()
    if request.GET.get('equi') == 'Details':
        d_id = 201
        
        cursors = connection.cursor()
        cursors.execute('''SELECT subevent_name,r_fees,date_of_event,details,event_poster,venue
                            FROM events_departmental
                            WHERE dept_id = %s''', [d_id])                    
        dept_events = cursors.fetchall() 
        #dept_events = list(record)                   
        return render(request,'equinox1.html',{'dept_events':dept_events})
    elif request.GET.get('invasion') == 'Details':
        d_id = 202
        
        cursors = connection.cursor()
        cursors.execute('''SELECT subevent_name,r_fees,date_of_event,details,event_poster,venue
                            FROM events_departmental
                            WHERE dept_id = %s''', [d_id])                    
        dept_events = cursors.fetchall() 
        #dept_events = list(record)                   
        return render(request,'equinox1.html',{'dept_events':dept_events}) 

    elif request.GET.get('tele') == 'Details':
        d_id = 203
        
        cursors = connection.cursor()
        cursors.execute('''SELECT subevent_name,r_fees,date_of_event,details,event_poster,venue
                            FROM events_departmental
                            WHERE dept_id = %s''', [d_id])                    
        dept_events = cursors.fetchall() 
        #dept_events = list(record)                   
        return render(request,'equinox1.html',{'dept_events':dept_events})  
    elif request.GET.get('civil') == 'Details':
        d_id = 204
       
        cursors = connection.cursor()
        cursors.execute('''SELECT subevent_name,r_fees,date_of_event,details,event_poster,venue
                            FROM events_departmental
                            WHERE dept_id = %s''', [d_id])                    
        dept_events = cursors.fetchall() 
        #dept_events = list(record)                   
        return render(request,'equinox1.html',{'dept_events':dept_events})        
             
    elif request.GET.get('chem') == 'More':
        d_id = 205
        
        cursors1 = connection.cursor()
        cursors1.execute('''SELECT subevent_name,r_fees,date_of_event,details,event_poster,venue
                            FROM events_departmental
                            WHERE dept_id = %s''', [d_id])                    
        dept_events = cursors1.fetchall() 
        #dept_events = list(record)                   
        return render(request,'equinox1.html',{'dept_events':dept_events})
    elif request.GET.get('mech') == 'Details':
        d_id = 206
        
        cursors = connection.cursor()
        cursors.execute('''SELECT subevent_name,r_fees,date_of_event,details,event_poster,venue
                            FROM events_departmental
                            WHERE dept_id = %s''', [d_id])                    
        dept_events = cursors.fetchall() 
        #dept_events = list(record)                   
        return render(request,'equinox1.html',{'dept_events':dept_events})  

    elif request.GET.get('it') == 'Details':
        d_id = 207
        
        cursors = connection.cursor()
        cursors.execute('''SELECT subevent_name,r_fees,date_of_event,details,event_poster,venue
                            FROM events_departmental
                            WHERE dept_id = %s''', [d_id])                    
        dept_events = cursors.fetchall() 
        #dept_events = list(record)                   
        return render(request,'equinox1.html',{'dept_events':dept_events})          
    

def register(request):
   return render(request,'register.html')

def notifications1(request):
    return notifications(request)
       

def template(request):
    id = getStudentId()
    cur = connection.cursor()
    cur.execute('''SELECT event_id
                            FROM Participates
                            WHERE student_id = %s''', [id])
    dashboard_results = getDashboardDetails(id,cur)
    
    return render(request,'template.html',{'dashboard_results':dashboard_results,"username": getAuthUserName()})  

def login(request):
    if request.method == 'POST':
        firstname = request.POST['firstname']
        lastname = request.POST['lastname']
        email = request.POST['email']
        year = int(request.POST['year'])
        department = request.POST['department']
        username = request.POST['username']
        password1 = request.POST['password']
        password2 = request.POST['re_password']
        if password1 == password2:
            user  = User.objects.create_user(username = username,password = password1,email=email,first_name = firstname,last_name = lastname)
            user.save()
            stud = Student(first_name=firstname,last_name=lastname,email_id=email,branch=department,year=year)
            stud.save()
           
		    #print("User created")
        return redirect('/')
    else:
        return render(request,'register.html')

def signin(request):
    return render(request,'signin.html')
    

def validate(request): 
    username = request.POST['username']
    password = request.POST['password']
    user = auth.authenticate(username = username,password = password)
    if user is not None:
        auth.login(request,user)
        setAuthUserName(user.username)
        cur = connection.cursor()
        cur.execute("SELECT student_id FROM events_student WHERE email_id = %s", [user.email])
        id, = cur.fetchone()
        setStudentId(id)
        dashboard_results = getDashboardDetails(id, cur)
        cur.close()
        return render(request,'template.html', {'dashboard_results' :  dashboard_results, "username": getAuthUserName()})
    else:
        messages.info(request,'Invalid username or password')
        return redirect('signin')      

def getDashboardDetails(id, cur):
    dashboard_results = []
    query_eventIds = '''SELECT Participates.event_id, event_name 
                        FROM Participates 
                        JOIN events_event 
                        ON Participates.event_id = events_event.event_id 
                        WHERE student_id = %s'''
    cur.execute(query_eventIds, [id])

    cur1 = connection.cursor()
    for event_id, major_event in cur.fetchall():
        if major_event == 'cultural':
            cur1.execute('''SELECT culture_name, venue, date_of_event 
                            FROM events_cultural 
                            WHERE event_id = %s''', [event_id])
        elif major_event == 'sports':
            cur1.execute('''SELECT sports_name, venue, date_of_event 
                            FROM events_sports
                            WHERE event_id = %s''', [event_id])
        elif major_event == 'departmental':
            cur1.execute('''SELECT subevent_name, venue, date_of_event 
                            FROM events_departmental
                            WHERE event_id = %s''', [event_id])
        dashboard_results.append(cur1.fetchone())
    cur1.close()
    return dashboard_results

def user1(request):
    return userdetails(request)

def editProfile(request):
    cur = connection.cursor()
    cur.execute('''SELECT email_id, first_name, last_name, branch, year
                   FROM events_student
                   WHERE student_id = %s''', [getStudentId()])
    email, firstname, lastname, branch, year = cur.fetchone()
    cur.close()
    cur1 = connection.cursor()
    fname = request.POST['firstname']
    lname = request.POST['lastname']
    br = request.POST['department']
    yr = int(request.POST['year'])
    if fname != firstname:
        cur1.execute('''UPDATE events_student
                        SET first_name = %s
                        WHERE student_id = %s''', [fname, getStudentId()])
        cur2 = connection.cursor()
        cur2.execute('''UPDATE auth_user
                        SET first_name = %s
                        WHERE email = %s''', [fname, email])
        cur2.close()
    if lname != lastname:
        cur1.execute('''UPDATE events_student
                        SET last_name = %s
                        WHERE student_id = %s''', [lname, getStudentId()])
        cur2 = connection.cursor()
        cur2.execute('''UPDATE auth_user
                        SET last_name = %s
                        WHERE email = %s''', [lname, email])
        cur2.close()
    if br != branch:
        cur1.execute('''UPDATE events_student
                        SET branch = %s
                        WHERE student_id = %s''', [br, getStudentId()])
    if yr != year:
        cur1.execute('''UPDATE events_student
                        SET year = %s
                        WHERE student_id = %s''', [int(yr), getStudentId()])
    cur1.close()

    return userdetails(request)
		   	
def logout(request):
	auth.logout(request)
	return redirect('/')               

def userdetails(request):
    cur = connection.cursor()
    cur.execute('''SELECT email_id, first_name, last_name, branch, year
                   FROM events_student
                   WHERE student_id = %s''', [getStudentId()])
    profileResults = cur.fetchone()
    cur.close()
    return render(request,'user1.html', {'profileResults' : profileResults, "username": getAuthUserName()})   

def notifications(request):
    return render(request,'notifications1.html', {"username": getAuthUserName()})  

def table1(request):
    return table(request)

def afterlogin(request):
    return render(request,'afterlogin.html')        

def table(request):
    cur = connection.cursor()
    summary_results = []
    query_eventIds = '''SELECT Participates.event_id, event_name 
                        FROM Participates 
                        JOIN events_event 
                        ON Participates.event_id = events_event.event_id 
                        WHERE student_id = %s'''
    cur.execute(query_eventIds, [getStudentId()])

    cur1 = connection.cursor()
    for event_id, major_event in cur.fetchall():
        if major_event == 'cultural':
            cur1.execute('''SELECT culture_name, date_of_event, r_fees
                            FROM events_cultural 
                            WHERE event_id = %s''', [event_id])
        elif major_event == 'sports':
            cur1.execute('''SELECT sports_name, date_of_event, r_fees
                            FROM events_sports
                            WHERE event_id = %s''', [event_id])
        elif major_event == 'departmental':
            cur1.execute('''SELECT subevent_name, date_of_event, r_fees
                            FROM events_departmental
                            WHERE event_id = %s''', [event_id])
        summary_results.append(cur1.fetchone())
    cur1.close()

    return render(request,'table.html', {'summary_results': summary_results , "username": getAuthUserName()})       