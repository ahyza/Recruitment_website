import sys
from PyQt5.QtWidgets import QApplication, QMainWindow, QPushButton, QLabel, QLineEdit


class OLEDControlPanel(QMainWindow):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.setWindowTitle('OLED Control Panel')
        self.setGeometry(100, 100, 300, 200)

        # Input field for text
        self.label = QLabel('Text to display:', self)
        self.label.move(20, 20)
        self.text_input = QLineEdit(self)
        self.text_input.move(20, 50)

        # Button to send text to OLED
        self.button = QPushButton('Display on OLED', self)
        self.button.move(20, 100)
        self.button.clicked.connect(self.display_text)

    def display_text(self):
        text = self.text_input.text()
        self.update_oled_display(text)

    def update_oled_display(self, text):
        # Here we would send text to the OLED display
        # Using the previous OLED control code:
        from PIL import Image, ImageDraw, ImageFont
        from luma.core.interface.serial import i2c
        from luma.oled.device import ssd1306

        serial = i2c(port=1, address=0x3C)
        device = ssd1306(serial)

        image = Image.new('1', (device.width, device.height))
        draw = ImageDraw.Draw(image)

        font = ImageFont.load_default()
        draw.text((10, 10), text, font=font, fill=255)

        device.display(image)


# Run the application
if __name__ == '__main__':
    app = QApplication(sys.argv)
    control_panel = OLEDControlPanel()
    control_panel.show()
    sys.exit(app.exec_())
