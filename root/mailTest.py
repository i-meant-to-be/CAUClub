from email.mime.text import MIMEText
import smtplib

sendAcc = "cauclub@naver.com"
sendPwd = ""
recvAcc = "shineksu813@outlook.com"

smtpServer = "smtp.naver.com"
smtpPort = 587

msg = MIMEText("테스트 이메일입니다.", _charset = "utf8")
msg['Subject'] = "테스트 이메일"
msg['From'] = sendAcc
msg['To'] = recvAcc

try:
    smtp = smtplib.SMTP(smtpServer, smtpPort)
    smtp.starttls()
    smtp.login(sendAcc, sendPwd)
    smtp.sendmail(sendAcc, recvAcc, msg.as_string())
    smtp.close()
    print("Success")
except:
    print("Failed")