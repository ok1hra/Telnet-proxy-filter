# Telnet proxy filter

**MITM telnet proxy for filtrate occupants in DX cluster**

## How to use on linux
- Start the cw skimmer server in wine, for example: `wine /home/dan/.wine/drive_c/Program\ Files/Afreet/SkimSrv/SkimSrv.exe`
- Change the port in skimmer server to **7301**
- Copy the files from github into one directory `git clone git@github.com:ok1hra/Telnet-proxy-filter.git`
- Set the permissions with the command `cd Telnet-proxy-filter && chmod 766 *.sh`
- Install socat if not present, for example by command `sudo apt install socat`
- Run proxy in terminal `./occupant-telnet-proxy-filter.sh`
- Run `wine Aggregator_v6.4.exe` and setup.
<br>

---

<br><br>

![occupants](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Franti%C5%A1ek_Dost%C3%A1l_Srpen_1968_4_%28cropped%29.jpg/330px-Franti%C5%A1ek_Dost%C3%A1l_Srpen_1968_4_%28cropped%29.jpg)
<br>*This project was published symbolically on Day of Memory (August 21, 1968) – marking [the invasion and occupation that ended the Prague Spring,](https://en.wikipedia.org/wiki/Warsaw_Pact_invasion_of_Czechoslovakia) a pivotal moment in Czechoslovak history.*
