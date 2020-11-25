from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.contrib import messages
from django.contrib.auth.models import User,auth

# Create your views here.
def home(request):
    return render(request,'home.html')

def about(request):
    return render(request,'about.html')

def sports(request):
    return render(request,'sports.html')

def clubs(request):
    return render(request,'clubs.html')

def cultural(request):
    return render(request,'cultural.html')

def department(request):
    return render(request,'department.html')

def equinox1(request):
    return render(request,'equinox1.html')

def register(request):
   return render(request,'register.html')
   
def login(request):
    if request.method == 'POST':
        firstname = request.POST['firstname']
        lastname = request.POST['lastname']
        email = request.POST['email']
        username = request.POST['username']
        password1 = request.POST['password']
        password2 = request.POST['re_password']
        if password1 == password2:
            user  = User.objects.create_user(username = username,password = password1,email=email,first_name = firstname,last_name = lastname)
            user.save()
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
        return redirect('/')
    else:
        messages.info(request,'invalid')
        return redirect('signin')       
		   	
def logout(request):
	auth.logout(request)
	return redirect('/')               