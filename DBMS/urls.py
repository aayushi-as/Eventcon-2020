"""DBMS URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from events import views

urlpatterns = [
    path('admin/', admin.site.urls),
    #app
    path('',views.home,name='home'),
    path('about/',views.about,name='about'),
    path('sports/',views.sports,name='sports'),
    path('clubs/',views.clubs,name='clubs'),
    path('cultural/',views.cultural,name='cultural'),
    path('department/',views.department,name='department'),
    path('equinox1/',views.equinox1,name='equinox1'),
    path('register/',views.register,name='register'),
    path('register/login',views.login,name='login'),
    path('signin/',views.signin,name='signin'),
    path('signin/userdetails',views.userdetails,name='userdetails'),
    path('signin/notifications',views.notifications,name='notifications'),
    path('signin/table',views.table,name='table'),
    path('signin/validate',views.validate,name='validate'),
    path('logout',views.logout,name='logout'),
    path('signin/editProfile', views.editProfile, name="editProfile")
]
