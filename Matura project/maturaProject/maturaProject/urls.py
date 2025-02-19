"""maturaProject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
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
from django.conf.urls import url, include
from NewsPage import views
from Sections import views as sc_views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    #url(r'^Vesti/', include('NewsPage.urls')),
    #url(r'^Vesti/', views.info_Page, name="info_Page"),
    url(r'^$', views.first_Page, name="first_Page"),
    url(r'^Sekcije/', sc_views.sections, name="sections"),
    url(r'^Vesti', views.info_Page, name="info_Page"),
    url(r'^Procitaj vise', views.news, name="news"),

]
