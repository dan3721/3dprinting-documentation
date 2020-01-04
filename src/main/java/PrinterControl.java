import com.fazecast.jSerialComm.SerialPort;
import com.fazecast.jSerialComm.SerialPortTimeoutException;

import java.io.*;
import java.util.Arrays;

import static java.lang.System.out;


public class PrinterControl {

    private SerialPort _port;
    private BufferedReader _portIn;
    private PrintWriter _portOut;
    private BufferedReader _input;

    private PrinterControl() {
    }

    private final void connect() throws Exception {
        _input = new BufferedReader(new InputStreamReader(System.in));
        SerialPort[] serialPorts = SerialPort.getCommPorts();
        _port = Arrays.stream(serialPorts)
                .filter(p -> "USB Serial".equals(p.getDescriptivePortName()))
                .findFirst().get();
        boolean openSuccess = _port.openPort();
        if (openSuccess) {
            _port.setBaudRate(115200);
            _port.setComPortTimeouts(SerialPort.TIMEOUT_READ_SEMI_BLOCKING, 3000, 3000);

            Thread.sleep(1000 * 5);

            InputStream in = _port.getInputStream();
            _portIn = new BufferedReader(new InputStreamReader(in));

            OutputStream os = _port.getOutputStream();
            _portOut = new PrintWriter(os);

//            log(read());

            log("Connected to: {}. Press q to quit.", _port.getDescriptivePortName());
            log(">");

        } else {
            throw new Exception("Failed to connect!");
        }
    }

    private final String read() throws IOException {
        StringBuilder sb = new StringBuilder();
        String line = null;
        for (; ; ) {
            try {
                line = _portIn.readLine();
//                out.println("line-> "+line);
                sb.append(line);
                sb.append("\n");
            } catch (SerialPortTimeoutException e) { // no more data available
                break;
            }
        }

//        for (int j = 0; j < 2000; ++j)
//            System.out.print((char) in.read());
//        in.close();
//        out.println("CLOSE");

        return sb.toString();
    }

    private final void disconnect() {
        if (_portIn != null) {
            try {
                _portIn.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (_input != null) {
            try {
                _input.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (_portOut != null) {
            _portOut.close();
        }
        if (_port != null) {
            _port.closePort();
        }
    }

    private final void log(String msg, String... args) {
        if (args != null || args.length == 0) {
            out.println(String.format(msg, args));
        } else {
            out.println(msg);
        }
    }

    private final void send(String gcode) {
        _portOut.println(gcode);
    }

    private final String readCMD() throws IOException {
        return _input.readLine();
    }


    public static void main(String[] args) throws IOException, InterruptedException {

        PrinterControl p = new PrinterControl();
        try {
            p.connect();

            p.send("M117 hello world!"); // LCD
            p.send("M114");
            String result = p.read();

            out.println("result=>"+result);

//            p.send("G28"); // Home
//            p.send("M114");

            String cmd;
            for (; ; ) {
                cmd = p.readCMD();
                if ("q".equals(cmd)) {
                    break;
                } else {
                    p.send(cmd);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(-1);
        } finally {
            p.disconnect();
        }


    }
}
