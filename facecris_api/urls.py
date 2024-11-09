from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from rest_framework.documentation import include_docs_urls
from rest_framework_simplejwt.views import TokenRefreshView
from blog.views import assign_admin, list_users
from facecris_api import settings

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/", include("blog.urls")),
    path("api/docs/", include_docs_urls(title="Blog API")),
    path("api/auth/", include("djoser.urls")),
    path("api/auth/", include("djoser.urls.jwt")),
    path("api/auth/token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
    path("api/users/", list_users, name="list_users"),
    path("api/users/<int:user_id>/assign_admin/", assign_admin, name="assign_admin"),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
