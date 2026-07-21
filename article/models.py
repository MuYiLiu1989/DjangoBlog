from django.db import models
from mdeditor.fields import MDTextField

# Create your models here.

class Post(models.Model):
    title = models.CharField(max_length=200)
    slug = models.CharField(max_length=200)
    #content = models.TextField()
    content = MDTextField()  # 直接使用 MDTextField
    pub_date = models.DateTimeField(auto_now_add=True)


    class Meta:
        ordering = ['-pub_date']


    def __str__(self):
        return self.title
