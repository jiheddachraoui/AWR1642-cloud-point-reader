# AWR1642-cloud-point-reader



I've changed the project of ibaiGorodo to adapt it on my board.


Link : https://github.com/ibaiGorordo/AWR1843-Read-Data-Python-MMWAVE-SDK-3- 



#Read Data  (Python 3 and matlab)

Python program to read and plot the data in real time from the **AWR1642** mmWave radar board (Texas Instruments, MMWAVE SDK 3). The program has been tested with Windows 10 and Raspberry Pi 4.

First, the program configures the Serial ports and sends the CLI commands defined in the configuration file to the radar. Next, the data comming from the radar is parsed to extract the 3D position and doppler velocity of the reflected points. Finally, the 2D position of the reflected points is shown in a scatter plot.


## HOW TO USE
* Download the required packages.
* Change the name of the configuration file (.cfg).
* Change the serial ports.
* If **not all the antennas** are being used, then change the value of **numRxAnt** and **numTxAnt**.
* Run the program.
* The data of each frame with the position and velocities of the reflected points is stored in the **detObj** dictionary. Each frame data is stored in the **frameData** dictionary array.

