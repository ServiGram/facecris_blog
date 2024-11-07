from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from rest_framework.documentation import include_docs_urls
from rest_framework_simplejwt.views import TokenRefreshView

from facecris_api import settings

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/", include("blog.urls")),
    path("api/docs/", include_docs_urls(title="Blog API")),  # Incluir las URLs del blog
    path("api/auth/", include("djoser.urls")),  # Djoser para usuarios
    path("api/auth/", include("djoser.urls.jwt")),  # Djoser JWT endpoints
    path("api/auth/token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
]

# Solo sirve archivos de medios en modo DEBUG
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
