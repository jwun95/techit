from django.shortcuts import render

# Create your views here.
from django.urls import reverse
from django.views.generic import CreateView

from profileapp.forms import ProfileForm
from profileapp.models import Profile


class ProfileCreateView(CreateView):
    model = Profile
    form_class = ProfileForm
    template_name = 'profileapp/create.html'

    def get_success_url(self):
        return reverse('accountapp:detail',
                       kwargs={'pk': self.kwargs['pk']})

