# coding=utf-8
from account.models import Profile
from ckeditor.widgets import CKEditorWidget
from django import forms
from .models import *
from django.contrib import admin
from django.utils.translation import ugettext_lazy as _


class CityForm(forms.ModelForm):
    city_css = forms.CharField(widget=CKEditorWidget(), required=False)
    about = forms.CharField(widget=CKEditorWidget(), required=False)
    name = forms.CharField(max_length=200)
    short_name = forms.CharField(max_length=5)

    class Meta:
        model = City
        fields = "__all__"


class CityAdmin(admin.ModelAdmin):
    form = CityForm
    list_display = ('name',)

    def save_form(self, request, form, change):
        if request.user.is_staff and not request.user.is_superuser:
            name = form.initial["name"]
            form.instance.name = name

            short_name = form.initial["short_name"]
            form.instance.short_name = short_name
        return form.save(commit=False)

    def has_change_permission(self, request, obj=None):
        default_permission = super(CityAdmin, self).has_change_permission(request, obj)
        if request.user.is_superuser:
            return default_permission
        else:
            profile = Profile.objects.get(user=request.user)
            if obj is None or obj.pk == profile.city.pk:
                return default_permission
            else:
                return False

    def get_form(self, request, obj=None, **kwargs):
        if request.user.is_staff and not request.user.is_superuser:
            self.exclude = ('name', 'short_name')
        form = super(CityAdmin, self).get_form(request, obj, **kwargs)
        return form

    def get_queryset(self, request):
        qs = super(CityAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs
        profile = Profile.objects.get(user=request.user)
        if profile.city is None:
            return City.objects.none()
        return qs.filter(pk=profile.city.pk)

admin.site.register(City, CityAdmin)


class RulesForm(forms.ModelForm):
    regulations = forms.CharField(widget=CKEditorWidget(), required=False)
    states = forms.CharField(widget=CKEditorWidget(), required=False)
    technical_rules = forms.CharField(widget=CKEditorWidget(), required=False)

    def is_valid(self):
        is_valid = super(RulesForm, self).is_valid()
        if len(Rules.objects.filter(city=self.instance.city)) > 0 and "city" in self.changed_data:
            self.add_error('regulations', _(u"Такие Правила уже существуют!"))
            return False
        else:
            return is_valid

    class Meta:
        model = Rules
        fields = "__all__"


class RulesAdmin(admin.ModelAdmin):
    form = RulesForm

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
            else:
                profile = Profile.objects.get(user=request.user)
                form.instance.city = profile.city
                if profile.city is None:
                    form.instance.city_id = None
                else:
                    form.instance.city_id = profile.city.pk
        return form.save(commit=False)

    def has_change_permission(self, request, obj=None):
        default_permission = super(RulesAdmin, self).has_change_permission(request, obj)
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
            self.exclude = ('city',)
        form = super(RulesAdmin, self).get_form(request, obj, **kwargs)
        return form

    def get_queryset(self, request):
        qs = super(RulesAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs
        profile = Profile.objects.get(user=request.user)
        return qs.filter(city=profile.city)

admin.site.register(Rules, RulesAdmin)