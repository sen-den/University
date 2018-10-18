from flask import Flask, request
import PyPDF2
 
app = Flask(__name__)
     
     
@app.route("/", methods=['POST'])
def simple():
        app.logger.debug('HHHH: %s', request.headers)
        app.logger.debug('BBBB: %s', request.get_data())
        app.logger.debug('AAAA: %s', request.json)
        return 'i' 
     
     
if __name__ == "__main__":
    app.run(debug=True)
