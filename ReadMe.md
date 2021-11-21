# **CS203 Project: Encryption Decryption using MM**

# **Instructions:**
   - ## *How to run:*
      1. Firstly write the message you want to send to the user in "inputstring.txt".
      2. Then write the key, i.e 2*2 matrix, in "inputkey.txt".
      3. Then run "user_to_verilog.c" which writes corresponding message in ascii codes in "output.txt"
      4. Then run "Encrypter.v" which will convert message into encrypted numbers.
      5. Then enter the password, i.e the same key matrix, in "password.txt".
      6. Then run "Decrypter.v" which will decrypt the encrypted matrix into ascii codes, if password is correct, in "decryptedmatrix.txt".
      7. Finally run "verilog_to_user.c" to get the message in "decryptedmessage.txt"

# Module Hierarchy

<p align="center">
  <img src="https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggVERcbiAgICBBW2lucHV0a2V5LnR4dF0gLS0-fGlucHV0fCBCW2VuY3J5cHRlci52XVxuICAgIENbaW5wdXRzdHJpbmcudHh0XSAtLT4gfGlucHV0fCBEW3VzZXJfdG9fdmVyaWxvZy5jXSBcbiAgICBEIC0tPiB8Y29udmVyc2lvbiB0byBhc2NpaSBjb2Rlc3xFW291dHB1dC50eHRdXG4gICAgRS0tPkJcbiAgICBCLS0-IHxvdXRwdXR8RltlbmNyeXB0ZWRtYXRyaXgudHh0XVxuICAgIEYtLT4gfGlucHV0fEdbRGVjcnlwdGVyLnZdXG4gICAgSFtwYXNzd29yZC50eHRdLS0-fGlucHV0fEdcbiAgICBHLS0-fG91dHB1dHxLW2RlY3J5cHRlZG1hdHJpeC50eHRdXG4gICAgSy0tPnxpbnB1dHxKW3Zlcmlsb2dfdG9fdXNlci5jXVxuICAgIEotLT58b3V0cHV0fElbRGVjcnlwdGVkTWVzc2FnZS50eHRdXG5cbiAgIiwibWVybWFpZCI6eyJ0aGVtZSI6IiJ9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlLCJhdXRvU3luYyI6dHJ1ZSwidXBkYXRlRGlhZ3JhbSI6dHJ1ZX0
" />
</p>

# Important Notes:
    1. Encrypter.v can encrypt upto 2000 characters in a single go, we are looking to make this limit dynamic (if possible).
       Thus, the text in inputstring.txt should not exceed 2000 characters.
    2. inputkey.txt should have a 2*2 matrix of integers, falling in the range 1 to 127 inclusive.

   