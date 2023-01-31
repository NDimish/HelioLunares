from rest_framework.response import Response
from rest_framework.decorators import api_view

"""A quick example using the django rest framework"""
@api_view(['GET'])
def getData(request):
    person = {'name':'Dennis', 'age':28}
    return Response(person)

