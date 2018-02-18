import os
from eve import Eve
import platform
import psutil
from flask import request

my_settings = {
        'MONGO_HOST': 'localhost',
        'MONGO_PORT':27017,
        'MONGO_DBNAME':'the_db_name',
        'DOMAIN':{'contacts':{}}
}

app = Eve()

@app.route('/proc')

def proc():
	name=platform.processor()
	uname=platform.uname()
	sys=platform.system()
	s1 = []
	s1.append(sys)
	s1.append(name)
	return "".join(s1)
@app.route('/ram')

def ram():
        ramUsage = {'memory': str(psutil.virtual_memory())}
        print(type(ramUsage))
        return str(ramUsage)

@app.route('/disk')
    
def disk():
        diskUsage = str(psutil.disk_usage('/'))
        return "physical disk usage: "+diskUsage+"\n"

@app.route('/user')
def user():
	current_users = psutil.users()
	return str(current_users)

@app.route("/process/<id>")
def process_id(id):
	process_id_info = {}
	pids = psutil.pids()
	try:
		process_name = psutil.Process(int(id))
		info = {"pid": process_name.pid,
			"status": process_name.status(),
			"percent_cpu_used": process_name.cpu_percent(interval=
			0.0),
			"percent_memory_used": process_name.memory_percent()}

	except (psutil.ZombieProcess, psutil.AccessDenied, psutil.NoSuchProcess
		):
		info = None
	if info is not None:
		app3 = "<html><body>Process Stats"+str(info)+"</body></html>"
		return app3
	return "Process not Found please enter a valid process id"	
	
	
if __name__ == '__main__':
    app.run()
