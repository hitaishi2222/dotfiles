# dark_theme_loader.py
import os

from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import QFile, QTextStream

app = QApplication.instance()
if app:
    qss_path = os.path.expanduser("/home/hiti/Hiti/dotfiles/scripts/dark_qt.qss")
    if os.path.exists(qss_path):
        with open(qss_path, "r") as f:
            app.setStyle("Fusion")
            app.setStyleSheet(f.read())
