from django.contrib import admin
from django.urls import path, include
from rest_framework.documentation import include_docs_urls

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/", include("blog.urls")),
    path("api/docs/", include_docs_urls(title="Blog API")),  # Incluir las URLs del blog
    path("api/auth/", include("djoser.urls")),  # Djoser para usuarios
    path("api/auth/", include("djoser.urls.jwt")),  # Djoser JWT endpoints
]
