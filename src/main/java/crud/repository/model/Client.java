package crud.repository.model;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

public class Client implements Runnable {
    private String name;
    private Socket clientSocket;

    private ObjectOutputStream outputStream;
    public Client( Socket clientSocket) {
        this.clientSocket = clientSocket;
        try {
            outputStream = new ObjectOutputStream(clientSocket.getOutputStream());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public ObjectOutputStream getOutputStream() {
        return outputStream;
    }

    @Override
    public void run() {
        try {
            ObjectInputStream entryData = new ObjectInputStream(clientSocket.getInputStream());
            while (true) {
                Object rawData = entryData.readObject();
                System.out.println("recibido");
                if (rawData instanceof HandShake) {
                    HandShake handShake = (HandShake) rawData;
                    name = handShake.getClientName();
                    MainServer.connectionList.add(this);
                    System.out.println("añadido a la lista");
                } else if (rawData instanceof Message) {
                    Message message = (Message) rawData;
                    System.out.println("mensaje recibido " + message.getMessageForDestination());
                    MainServer.sendMsgToSomeone(message);
                }
            }   






        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public String getName() {
        return name;
    }

    public Socket getClientSocket() {
        return clientSocket;
    }
}
