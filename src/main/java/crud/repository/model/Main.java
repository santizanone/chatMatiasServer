package crud.repository.model;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

public class Main {

    private final static int PORT = 9999;
    static volatile ArrayList<Client> connectionList = new ArrayList<>();

    public static void main(String[] args) {
        try {
            ServerSocket server = new ServerSocket(PORT);
            System.out.println("SERVER RUNNING");
            while (true){
                Socket socketClient = server.accept();
                System.out.println("CLIENT CONNECTED " + socketClient.getInetAddress());
                new Thread(new Client(socketClient)).start();
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    public static void sendMsgToEveryone(Message message){

    }

    public static void sendMsgToSomeone(Message message){
        for (Client client:connectionList){
            if (client.getName().equals(message.getDestinationClientName())){
                try {
                    ObjectOutputStream outputStream = client.getOutputStream();
                    outputStream.writeObject(message);
                    outputStream.flush();
                    System.out.println("enviado");
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }

}