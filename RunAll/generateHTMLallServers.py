import os.path

html='''<!DOCTYPE html><html><head><style>table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
}

td, th {
    border: 0.8px solid #dddddd;
    text-align: left;
    padding: 1px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style></head><body><table>'''

import os
with os.popen("grep -r \$IP: ../*") as f:
    lines = f.readlines()
    for line in lines:
        if "/runInDocker.sh" in line:
            [name, rest] = line.split("/runInDocker.sh")
            name = name.replace("../", "").replace("/", " - ")
            port = line.split("$IP:")[1].split(":")[0]
            print(name+" "+port)
            url = "http://127.0.0.1:" + port
            html+='<tr><th><a href="{0}">{0}</a></td><td>&emsp;{1}</td></tr>\n'.format(url, name)
html+="</table></body></html>"


fname = "./all.html"
all_file = open(fname,"w")
all_file.writelines(html)
all_file.close()

