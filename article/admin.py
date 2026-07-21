from django.contrib import admin
from article.models import Post


# Register your models here.

admin.site.register(Post)

# @admin.register(Post)
# class PostAdmin(admin.ModelAdmin):
#     list_display = ['title', 'created_at']
    # 不需要特别配置，MDTextField 会自动渲染为 Markdown 编辑器