from django.http import HttpResponse
from django.urls import path


def index(request):
    return HttpResponse('Django app deployed by Jenkins, ECR, Helm and Argo CD')

urlpatterns = [
    path('', index),
]
