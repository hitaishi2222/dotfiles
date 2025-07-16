import subprocess
import pandas as pd

# NOTE: Code to generate the difference

cmd = ["ls", "/home/hiti/Pictures/HD_wallpapers/"]

process = subprocess.run(cmd, capture_output=True, text=True)

files = []

for file in process.stdout.split("\n"):
    if file == " " or file == "":
        continue
    else:
        files.append(f"/home/hiti/Pictures/HD_wallpapers/{file}")

output = []

for file in files:
    check = subprocess.run(["identify", file], capture_output=True, text=True)
    out = check.stdout.split()
    output.append(out[1])

ans = []
for i in range(len(files)):
    ext = files[i].split(".")[-1]
    if (ext == "jpg" or ext == "jpeg") and (output[i] == "JPEG" or output[i] == "JPG"):
        ans.append(True)
    elif (ext == "png" or ext == "PNG") and output[i] == "PNG":
        ans.append(True)
    elif (ext == "webp") and output[i] == "WEBP":
        ans.append(True)
    else:
        ans.append(False)


df = pd.DataFrame({"files": files, "type": output, "ans": ans})
df.to_csv("images_data.csv")
df[df.ans == False].to_csv("false_img.csv", index=None)

# NOTE: Code to fix it

# df = pd.read_csv("./false_img.csv")
# new_name = []
#
#
# def rename(filename: str, ext: str) -> str:
#     extension = ""
#     if ext == "JPEG":
#         extension = ".jpeg"
#     elif ext == "PNG":
#         extension = ".png"
#
#     name = filename.split(".")
#     return "".join(name[:-1]) + extension
#
#
# for i in range(len(df)):
#     data = df.iloc[i]
#     filename = data.files
#     ext = data.type
#     cmd = ["mv", filename, rename(filename, ext)]
#     subprocess.run(cmd)
