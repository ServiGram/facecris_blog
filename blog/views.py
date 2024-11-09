from rest_framework import viewsets
from .models import Post
from .serializers import PostSerializer
from rest_framework.permissions import (
    IsAuthenticatedOrReadOnly,
    IsAdminUser,
)
from django.contrib.auth import get_user_model
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response


class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    permission_classes = [
        IsAuthenticatedOrReadOnly
    ]  # Esto para que solo los usuarios registrados puedan escribir o responder


User = get_user_model()


@api_view(["GET"])
@permission_classes([IsAdminUser])
def list_users(request):
    users = User.objects.all().values("id", "username", "email", "is_admin")
    return Response(users)


@api_view(["POST"])
@permission_classes([IsAdminUser])
def assign_admin(request, user_id):
    try:
        user = User.objects.get(id=user_id)
        user.is_admin = True
        user.save()
        return Response({"message": "User updated to admin."})
    except User.DoesNotExist:
        return Response({"error": "User not found"}, status=404)
