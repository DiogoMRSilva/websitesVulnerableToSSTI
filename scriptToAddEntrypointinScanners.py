import requests



def getIndexVulnPage(ip, port, proxy, session = requests.Session()):
    url = "http://" + ip + ":" + str(port)
    session.post(url, proxies=proxy,data = {"name":"aa"})

def get_6001_destination_page(ip, proxy, session = requests.Session()):
    url = "http://" + ip + ":6001/stored"
    session.get(url, proxies=proxy)


ip_vulnservers = "127.0.0.1"
ports_vulns = [5000,5001,5002,5003,5020,5021,5022,5051,5052,5053,
    5061,5062,5063,5065,5066,5068,5080,5081,5090,6001,6002,6003,6004,6005,6010,6011,6012,6013,6014,6015]
port_proxy = 8080

proxies = {
  'http': 'http://127.0.0.1:'+str(port_proxy),
  'https': 'http://127.0.0.1:'+str(port_proxy), 
}

session = requests.Session()


for port in ports_vulns:
    getIndexVulnPage(ip_vulnservers, port, proxies, session)

get_6001_destination_page(ip_vulnservers, proxies, session)