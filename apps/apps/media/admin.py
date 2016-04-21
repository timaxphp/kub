from account.models import Profile
from tourney.models import City
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from django import forms
from .models import *
from django.contrib import admin


class MediaForm(forms.ModelForm):
    html = forms.CharField(widget=CKEditorUploadingWidget())

    class Meta:
        model = Media
        fields = "__all__"


class MediaAdmin(admin.ModelAdmin):
    form = MediaForm
    list_display = ('title', "author", "created_at", "type", "city")

    def save_form(self, request, form, change):
        if request.user.is_staff and not request.user.is_superuser:
            if change:
                if "city" in form.initial:
                    city_id = form.initial["city"]
                    city = City.objects.get(pk=city_id)
                    form.instance.city_id = city_id
                    form.instance.city = city
                else:
                    form.instance.city_id = None
                    form.instance.city = None

                if "author" in form.initial:
                    user_id = form.initial["author"]
                    user = User.objects.get(pk=user_id)
                    form.instance.author_id = user_id
                    form.instance.author = user
                else:
                    form.instance.author_id = None
                    form.instance.author = None
            else:
                profile = Profile.objects.get(user=request.user)
                form.instance.city = profile.city
                if profile.city is not None:
                    form.instance.city_id = profile.city.pk
                else:
                    form.instance.city_id = None
                form.instance.author = request.user
                form.instance.author_id = request.user.pk
        return form.save(commit=False)

    def has_change_permission(self, request, obj=None):
        default_permission = super(MediaAdmin, self).has_change_permission(request, obj)
        if request.user.is_superuser:
            return default_permission
        else:
            profile = Profile.objects.get(user=request.user)
            if obj is None or obj.city == profile.city:
                return default_permission
            else:
                return False

    def get_form(self, request, obj=None, **kwargs):
        if request.user.is_staff and not request.user.is_superuser:
            self.exclude = ('city', 'author',)
        form = super(MediaAdmin, self).get_form(request, obj, **kwargs)
        return form

    def get_queryset(self, request):
        qs = super(MediaAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs
        profile = Profile.objects.get(user=request.user)
        return qs.filter(city=profile.city)


admin.site.register(Media, MediaAdmin)
