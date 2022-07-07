from PyQt5.QtWidgets import QApplication, QWidget, QDesktopWidget, QVBoxLayout, QStackedWidget, QLabel, QPushButton, QGraphicsDropShadowEffect, QLineEdit
from PyQt5.QtGui import QFont, QFontDatabase, QIcon, QColor
from PyQt5.QtCore import Qt
import sys

class NotePad(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        