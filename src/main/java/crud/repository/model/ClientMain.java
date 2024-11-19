package crud.repository.model;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.util.Scanner;

public class ClientMain {
    public static void main(String[] args) throws IOException {
        Socket socket = new Socket(InetAddress.getLocalHost(), 9999);
        String clientName = "juan";
        String destination = "santino";
        HandShake handShake = new HandShake(clientName);
        ObjectOutputStream outputStream = new ObjectOutputStream(socket.getOutputStream());
        outputStream.writeObject(handShake);
        outputStream.flush();






        new Thread(new Runnable(){
            @Override
            public void run() {
                ObjectInputStream inputStream = null;
                try {
                    inputStream = new ObjectInputStream(socket.getInputStream());
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
                while (true) {
                    try {
                            Message message = (Message) inputStream.readObject();
                            System.out.println(message.getOriginClientName() + " " + message.getMessageForDestination());

                    } catch (IOException | ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }
                }
            }
        }).start();

        while (true){
            Scanner entry = new Scanner(System.in);
            String msg = entry.nextLine();
            Message message = new Message(clientName,destination,msg,false);
            outputStream.writeObject(message);
            outputStream.flush();
            System.out.println("enviado");

        }

    }
}
