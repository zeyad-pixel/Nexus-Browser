import sys
import os
import ctypes
from PyQt6.QtWidgets import QApplication
from PyQt6.QtCore import QUrl
from PyQt6.QtGui import QIcon
from ui.mwindow import MainWindow, PaddedWindow
from ui.tabbar import TabManager

def main():
    # 1. إجبار ويندوز على التعرف على التطبيق كبرنامج مستقل (حل مشكلة أيقونة بايثون)
    try:
        myappid = 'nexus.browser.nexus.1.0' 
        ctypes.windll.shell32.SetCurrentProcessExplicitAppUserModelID(myappid)
    except Exception as e:
        print(f"خطأ في تعريف معرف التطبيق: {e}")

    # 2. إعداد تطبيق Qt
    app = QApplication(sys.argv)

    # 3. تعريف مسار الأيقونة الصحيح (مجلد svg)
    icon_path = "D:/Nexus Browser/Desktop/src/svg/dbrowser_logo.ico"
    
    # 4. تعيين الأيقونة للتطبيق والنافذة
    if os.path.exists(icon_path):
        app.setWindowIcon(QIcon(icon_path))
    else:
        print(f"تنبيه: الملف غير موجود في المسار: {icon_path}")

    # 5. إعداد TabManager
    tab_manager = TabManager()

    # 6. معالجة فتح ملف عبر Arguments
    if len(sys.argv) > 1:
        file_to_open = sys.argv[1]
        if hasattr(tab_manager, 'browser_window'):
            tab_manager.browser_window.browser.setUrl(QUrl.fromLocalFile(os.path.abspath(file_to_open)))

    # 7. تعريف المكونات الأساسية للواجهة
    central_widget = PaddedWindow(tab_manager.content_stack, "#1e1e1e")

    # 8. إنشاء النافذة الرئيسية
    window = MainWindow(central_widget, tab_manager)
    
    # 9. تعيين الأيقونة للنافذة
    if os.path.exists(icon_path):
        window.setWindowIcon(QIcon(icon_path))

    # 10. عرض النافذة
    window.show()

    # 11. بدء حلقة تشغيل التطبيق
    sys.exit(app.exec())

if __name__ == "__main__":
    main()