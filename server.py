from sys import argv
from pprint import pprint
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return 'I work!'

if __name__ == '__main__':
    cmd = argv[1]
    match cmd:
        case 'run':
            app.run(debug=True)
        case 'test':
            pprint(home())
        case _:
            print(f'{cmd} is not a valid command')
            raise SystemExit(1)