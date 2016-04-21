from ckeditor.widgets import CKEditorWidget
from django import forms
from .models import *
from tourney.models import City
from django.contrib import admin

#    def is_valid(self):
#if hasattr(self.instance, 'pk'):


class ProfileForm(forms.ModelForm):

    class Meta:
        model = Profile
        fields = "__all__"


class ProfileAdmin(admin.ModelAdmin):
    list_display = ('name', 'city', 'user')

    def save_form(self, request, form, change):
        if request.user.is_staff and not request.user.is_superuser:
            if "city" in form.initial:
                city_id = form.initial["city"]
                city = City.objects.get(pk=city_id)
                form.instance.city_id = city_id
                form.instance.city = city
            else:
                form.instance.city_id = None
                form.instance.city = None

        return form.save(commit=False)

    def has_change_permission(self, request, obj=None):
        default_permission = super(ProfileAdmin, self).has_change_permission(request, obj)
        if request.user.is_superuser:
            return default_permission
        else:
            if obj is None or obj.user.pk == request.user.pk:
                return default_permission
            else:
                return False

    def get_form(self, request, obj=None, **kwargs):
        if request.user.is_staff and not request.user.is_superuser:
            self.exclude = ('city', 'user')
        form = super(ProfileAdmin, self).get_form(request, obj, **kwargs)
        return form

    def get_queryset(self, request):
        qs = super(ProfileAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs
        return qs.filter(user=request.user)


admin.site.register(Profile, ProfileAdmin)
