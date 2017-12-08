/* Propietario: Manuel Prada / Alexander correa 


 */
package ventanasGraficas;

import estructuraGrafo.Vertice;
import estructuraGrafo.Pintar;
import estructuraGrafo.Algoritmo_Dijkstra;
import java.awt.Color;
import java.awt.HeadlessException;//Excepción que se lanza cuando un código dependiente de teclado, monitor o ratón es ejecutado en un entorno que no soporta teclado, monitor o ratón.
import java.awt.Image;
import java.awt.image.BufferedImage;//clase es una subclase de la clase de imagen. Se utiliza para manejar y manipular los datos de imagen
import java.io.File;
import javax.imageio.ImageIO;//Una clase que contiene métodos de conveniencia estáticas para localizar imegnes 
import javax.swing.ImageIcon;// dibuja una imagen de JPG
import javax.swing.JOptionPane;// El ultimo parametro es un icono, si se coloca null se colocara el icono predeterminado por el tipo de mensaje.

/**
 *
 * @author Manuel Prada / Alexander correa 
 */
public class VentanaPrincipal extends javax.swing.JFrame { //generar ventanas sobre las cuales añadir distintos objetos con los que podrá interactuar o no el usuario.

    /**
     * Creates new form VentanaPincipal
     */
    Pintar pintar = new Pintar();
    Vertice arboles = new Vertice();

    public static void R_repaint(int tope, Vertice arboles) {//pinta lo q esta antes en el panel       
        for (int j = 0; j < tope; j++) {
            for (int k = 0; k < tope; k++) {
                if (arboles.getmAdyacencia(j, k) == 1) {
                    Pintar.pintarLinea(jPanel1.getGraphics(), arboles.getCordeX(j), arboles.getCordeY(j), arboles.getCordeX(k), arboles.getCordeY(k), arboles.getmCoeficiente(j, k));
                }
            }
        }
        for (int j = 0; j < tope; j++) {
            Pintar.pintarCirculo(jPanel1.getGraphics(), arboles.getCordeX(j), arboles.getCordeY(j), String.valueOf(arboles.getNombre(j)) + ";" + arboles.getNombreCiudad(j));
        }

    }

    public static int ingresarNodoOrigen(String nodoOrige, String noExiste, int tope) {
        int nodoOrigen = 0;
        try {
            nodoOrigen = Integer.parseInt(JOptionPane.showInputDialog("" + nodoOrige));
            if (nodoOrigen >= tope) {
                JOptionPane.showMessageDialog(null, "" + noExiste + "\nDebe de ingresar una Ciudad existente");
                nodoOrigen = ingresarNodoOrigen(nodoOrige, noExiste, tope);
            }
        } catch (HeadlessException | NumberFormatException ex) {
            nodoOrigen = ingresarNodoOrigen(nodoOrige, noExiste, tope);
        }
        return nodoOrigen;
    }

    public int ingresarTamano(String tama) {
        int tamano = 0;
        try {
            tamano = Integer.parseInt(JOptionPane.showInputDialog("" + tama));
            if (tamano < 1) {
                JOptionPane.showMessageDialog(null, "Debe Ingresar un Tamaño Aceptado..");
                tamano = ingresarTamano(tama);//no es nesario hacer esto
            }
        } catch (Exception ex) {
            tamano = ingresarTamano(tama);
        }
        return tamano;
    }

    public boolean cicDerechoSobreNodo(int xxx, int yyy) {

        for (int j = 0; j < tope; j++) {// consultamos si se ha sado  click sobre algun nodo 
            if ((xxx + 2) > arboles.getCordeX(j) && xxx < (arboles.getCordeX(j) + 13) && (yyy + 2) > arboles.getCordeY(j) && yyy < (arboles.getCordeY(j) + 13)) {

                if (n == 0) {
                    System.out.println("Ciudad: " + j);
                    identLabel1.setText(String.valueOf(j));
                    ipLabel1.setText(arboles.getIp(j));
                    nombreLabel1.setText(arboles.getNombreCiudad(j));
                    id = j;
                    R_repaint(tope, arboles);
                    Pintar.clickSobreNodo(jPanel1.getGraphics(), arboles.getCordeX(j), arboles.getCordeY(j), null, Color.orange);
                    n++;
                } else {
                    identLabe2.setText(String.valueOf(j));
                    ipLabe2.setText(arboles.getIp(j));
                    nombreLabe2.setText(arboles.getNombreCiudad(j));
                    id2 = j;
                    n++;
                    Pintar.clickSobreNodo(jPanel1.getGraphics(), arboles.getCordeX(j), arboles.getCordeY(j), null, Color.orange);
                    if (id == id2) {// si id == id2 por que se volvio a dar click sobre el mismos nodo, se cancela el click anterior
                        n = 0;
                        Pintar.pintarCirculo(jPanel1.getGraphics(), arboles.getCordeX(id), arboles.getCordeY(id), String.valueOf(arboles.getNombre(id)) + ";" + arboles.getNombreCiudad(id));
                        id = -1;
                        id2 = -1;
                    }
                }
                nn = 0;
                return true;
            }
        }
        return false;
    }

    public void clicIzqSobreNodo(int xxx, int yyy) {
        for (int j = 0; j < tope; j++) {
            if ((xxx + 2) > arboles.getCordeX(j) && xxx < (arboles.getCordeX(j) + 13) && (yyy + 2) > arboles.getCordeY(j) && yyy < (arboles.getCordeY(j) + 13)) {
                if (nn == 0) {
                    permanente = j;
                    R_repaint(tope, arboles);
                } else {
                    nodoFin = j;
                }
                nn++;
                n = 0;
                id = -1;
                Pintar.clickSobreNodo(jPanel1.getGraphics(), arboles.getCordeX(j), arboles.getCordeY(j), null, Color.GREEN);
                break;
            }

        }

    }

    public void adactarImagen(File file) {
        try {

            BufferedImage read = ImageIO.read(file);
            Image scaledInstance = read.getScaledInstance(jmapa.getWidth(), jmapa.getHeight(), Image.SCALE_DEFAULT);

            jmapa.setIcon(new ImageIcon(scaledInstance));
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error ");
        }
    }

    public VentanaPrincipal() {
        initComponents();
        jPanel2.setVisible(true);

    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jmapa = new javax.swing.JLabel();
        jPanel5 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        identLabe2 = new javax.swing.JLabel();
        ipLabe2 = new javax.swing.JLabel();
        nombreLabe2 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        jTextField2 = new javax.swing.JTextField();
        jPanel4 = new javax.swing.JPanel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        identLabel1 = new javax.swing.JLabel();
        ipLabel1 = new javax.swing.JLabel();
        nombreLabel1 = new javax.swing.JLabel();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jSeparator1 = new javax.swing.JPopupMenu.Separator();
        jMenuItem13 = new javax.swing.JMenuItem();
        jSeparator3 = new javax.swing.JPopupMenu.Separator();
        jMenuItem2 = new javax.swing.JMenuItem();
        jSeparator2 = new javax.swing.JPopupMenu.Separator();
        jMenuItem1 = new javax.swing.JMenuItem();
        jSeparator5 = new javax.swing.JPopupMenu.Separator();
        jMenuItem8 = new javax.swing.JMenuItem();
        jMenu2 = new javax.swing.JMenu();
        jMenuItem10 = new javax.swing.JMenuItem();
        jMenuItem9 = new javax.swing.JMenuItem();
        jMenuItem11 = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle(">>  GRAFO NO DIRIGIDO <<");
        setBackground(new java.awt.Color(0, 0, 0));
        setResizable(false);
        getContentPane().setLayout(null);

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setBorder(javax.swing.BorderFactory.createMatteBorder(5, 5, 5, 5, new java.awt.Color(0, 0, 0)));
        jPanel1.setMinimumSize(new java.awt.Dimension(770, 522));
        jPanel1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                jPanel1MousePressed(evt);
            }
        });
        jPanel1.setLayout(null);

        jmapa.setBackground(new java.awt.Color(204, 204, 204));
        jmapa.setForeground(new java.awt.Color(255, 255, 51));
        jPanel1.add(jmapa);
        jmapa.setBounds(10, 10, 750, 530);
        jPanel1.add(jPanel5);
        jPanel5.setBounds(-350, 30, 330, 190);

        getContentPane().add(jPanel1);
        jPanel1.setBounds(310, 0, 770, 540);

        jPanel2.setBackground(new java.awt.Color(0, 0, 0));
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(""));
        jPanel2.setLayout(null);

        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Ciudad:");
        jPanel2.add(jLabel2);
        jLabel2.setBounds(10, 70, 80, 14);

        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Nodo:");
        jPanel2.add(jLabel3);
        jLabel3.setBounds(10, 30, 80, 14);

        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Cordenadas:");
        jPanel2.add(jLabel4);
        jLabel4.setBounds(10, 50, 80, 14);

        identLabe2.setForeground(new java.awt.Color(255, 255, 255));
        identLabe2.setMaximumSize(new java.awt.Dimension(20, 10));
        identLabe2.setPreferredSize(new java.awt.Dimension(20, 10));
        jPanel2.add(identLabe2);
        identLabe2.setBounds(90, 30, 150, 15);

        ipLabe2.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(ipLabe2);
        ipLabe2.setBounds(90, 50, 150, 15);

        nombreLabe2.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(nombreLabe2);
        nombreLabe2.setBounds(90, 70, 150, 15);

        getContentPane().add(jPanel2);
        jPanel2.setBounds(20, 260, 270, 130);

        jPanel3.setBackground(new java.awt.Color(0, 0, 0));
        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "RECORRIDO TOTAL", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 11), new java.awt.Color(255, 255, 255))); // NOI18N
        jPanel3.setForeground(new java.awt.Color(255, 255, 255));
        jPanel3.setLayout(null);

        jTextField2.setEnabled(false);
        jTextField2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField2ActionPerformed(evt);
            }
        });
        jPanel3.add(jTextField2);
        jTextField2.setBounds(10, 20, 200, 30);

        getContentPane().add(jPanel3);
        jPanel3.setBounds(30, 470, 230, 60);

        jPanel4.setBackground(new java.awt.Color(0, 0, 0));
        jPanel4.setBorder(javax.swing.BorderFactory.createTitledBorder(""));
        jPanel4.setForeground(new java.awt.Color(0, 0, 204));
        jPanel4.setToolTipText("");
        jPanel4.setLayout(null);

        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setText("Ciudad:");
        jPanel4.add(jLabel5);
        jLabel5.setBounds(10, 70, 80, 14);

        jLabel6.setBackground(new java.awt.Color(0, 153, 153));
        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setText("Nodo:");
        jPanel4.add(jLabel6);
        jLabel6.setBounds(10, 30, 80, 14);

        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setText("Cordenadas:");
        jPanel4.add(jLabel7);
        jLabel7.setBounds(10, 50, 80, 14);

        identLabel1.setBackground(new java.awt.Color(0, 153, 153));
        identLabel1.setForeground(new java.awt.Color(255, 255, 255));
        identLabel1.setMaximumSize(new java.awt.Dimension(20, 10));
        identLabel1.setPreferredSize(new java.awt.Dimension(20, 10));
        jPanel4.add(identLabel1);
        identLabel1.setBounds(90, 30, 160, 15);

        ipLabel1.setBackground(new java.awt.Color(0, 153, 153));
        ipLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jPanel4.add(ipLabel1);
        ipLabel1.setBounds(90, 50, 160, 15);

        nombreLabel1.setBackground(new java.awt.Color(0, 153, 153));
        nombreLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jPanel4.add(nombreLabel1);
        nombreLabel1.setBounds(90, 65, 160, 20);

        getContentPane().add(jPanel4);
        jPanel4.setBounds(20, 100, 270, 130);

        jMenuBar1.setBackground(new java.awt.Color(51, 51, 51));
        jMenuBar1.setForeground(new java.awt.Color(51, 51, 255));

        jMenu1.setBackground(new java.awt.Color(0, 0, 0));
        jMenu1.setForeground(new java.awt.Color(255, 255, 255));
        jMenu1.setText("Archivo");
        jMenu1.add(jSeparator1);

        jMenuItem13.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_C, java.awt.event.InputEvent.CTRL_MASK));
        jMenuItem13.setBackground(new java.awt.Color(0, 0, 0));
        jMenuItem13.setForeground(new java.awt.Color(255, 255, 255));
        jMenuItem13.setText("Camino Más Corto");
        jMenuItem13.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem13ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem13);
        jMenu1.add(jSeparator3);

        jMenuItem2.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_N, java.awt.event.InputEvent.CTRL_MASK));
        jMenuItem2.setBackground(new java.awt.Color(0, 0, 0));
        jMenuItem2.setForeground(new java.awt.Color(255, 255, 255));
        jMenuItem2.setText("Nueva Arco");
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem2);
        jMenu1.add(jSeparator2);

        jMenuItem1.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_N, java.awt.event.InputEvent.ALT_MASK));
        jMenuItem1.setBackground(new java.awt.Color(0, 0, 0));
        jMenuItem1.setForeground(new java.awt.Color(255, 255, 255));
        jMenuItem1.setText("Limpiar Pantalla");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem1);

        jSeparator5.setForeground(new java.awt.Color(102, 102, 102));
        jMenu1.add(jSeparator5);

        jMenuItem8.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_S, java.awt.event.InputEvent.CTRL_MASK));
        jMenuItem8.setBackground(new java.awt.Color(0, 0, 0));
        jMenuItem8.setForeground(new java.awt.Color(255, 255, 255));
        jMenuItem8.setText("Salir");
        jMenuItem8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem8ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem8);

        jMenuBar1.add(jMenu1);

        jMenu2.setBackground(new java.awt.Color(0, 0, 0));
        jMenu2.setForeground(new java.awt.Color(255, 255, 255));
        jMenu2.setText("Eliminar");

        jMenuItem10.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_E, java.awt.event.InputEvent.ALT_MASK));
        jMenuItem10.setBackground(new java.awt.Color(0, 0, 0));
        jMenuItem10.setForeground(new java.awt.Color(255, 255, 255));
        jMenuItem10.setText("Eliminar Ciudad");
        jMenuItem10.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem10ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem10);

        jMenuItem9.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_E, java.awt.event.InputEvent.CTRL_MASK));
        jMenuItem9.setBackground(new java.awt.Color(0, 0, 0));
        jMenuItem9.setForeground(new java.awt.Color(255, 255, 255));
        jMenuItem9.setText("Eliminar Arco");
        jMenuItem9.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem9ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem9);

        jMenuItem11.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_E, java.awt.event.InputEvent.ALT_MASK | java.awt.event.InputEvent.CTRL_MASK));
        jMenuItem11.setBackground(new java.awt.Color(0, 0, 0));
        jMenuItem11.setForeground(new java.awt.Color(255, 255, 255));
        jMenuItem11.setText("Eliminar Todos los Arcos");
        jMenuItem11.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem11ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem11);

        jMenuBar1.add(jMenu2);

        setJMenuBar(jMenuBar1);

        setSize(new java.awt.Dimension(1122, 623));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jPanel1MousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jPanel1MousePressed
        String ciudad = "", cordenadas = "";  //Permite poner la ciudad donde se da click
        int coordenadaX, coordenadaY;
        coordenadaX = evt.getX();
        coordenadaY = evt.getY();
        if (evt.isMetaDown()) {
            clicIzqSobreNodo(coordenadaX, coordenadaY);
            if (nn == 2) {
                nn = 0;
                Algoritmo_Dijkstra Dijkstra = new Algoritmo_Dijkstra(arboles, tope, permanente, nodoFin);
                Dijkstra.dijkstra();
                jTextField2.setText("" + Dijkstra.getAcumulado());

            }
        } else {
            if (!cicDerechoSobreNodo(coordenadaX, coordenadaY)) {// si  clik sobre  nodo es falso entra
                if (tope < 50) {
                    arboles.setCordeX(tope, coordenadaX);
                    arboles.setCordeY(tope, coordenadaY);
                    arboles.setNombre(tope, tope);
                    this.setEnabled(false);
                    //new Datos(tope,pintar,arboles,this).setVisible(true);
                    ciudad = JOptionPane.showInputDialog("Ingrese ciudad ");
                    cordenadas = JOptionPane.showInputDialog("Ingrese las cordenadas");
                    this.setEnabled(true);

                    if (!(cordenadas == null || ciudad == null)) {
                        arboles.setIp(tope, cordenadas);
                        arboles.setNombreCiudad(tope, ciudad);
                        Pintar.pintarCirculo(jPanel1.getGraphics(), arboles.getCordeX(tope), arboles.getCordeY(tope), String.valueOf(arboles.getNombre(tope)) + ";" + arboles.getNombreCiudad(tope));
                        tope++;
                    } else {
                        JOptionPane.showMessageDialog(null, "No se pudo crear la Ciudad..");
                    }

                    //jPanel1.paint(jPanel1.getGraphics());
                    //R_repaint(tope, arboles);
                } else {
                    JOptionPane.showMessageDialog(null, "Se ha llegado al Maximo de Ciudades..");
                }
            }
            if (n == 2) {
                n = 0;
                int ta = ingresarTamano("Ingrese Distancia entre Ciudades");
                if (aristaMayor < ta) {
                    aristaMayor = ta;
                }
                arboles.setmAdyacencia(id2, id, 1);
                arboles.setmAdyacencia(id, id2, 1);
                arboles.setmCoeficiente(id2, id, ta);
                arboles.setmCoeficiente(id, id2, ta);
                Pintar.pintarLinea(jPanel1.getGraphics(), arboles.getCordeX(id), arboles.getCordeY(id), arboles.getCordeX(id2), arboles.getCordeY(id2), ta);
                Pintar.pintarCirculo(jPanel1.getGraphics(), arboles.getCordeX(id), arboles.getCordeY(id), String.valueOf(arboles.getNombre(id)) + ";" + arboles.getNombreCiudad(id));
                Pintar.pintarCirculo(jPanel1.getGraphics(), arboles.getCordeX(id2), arboles.getCordeY(id2), String.valueOf(arboles.getNombre(id2)) + ";" + arboles.getNombreCiudad(id2));
                id = -1;
                id2 = -1;
            }
        }
    }//GEN-LAST:event_jPanel1MousePressed

    private void jMenuItem9ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem9ActionPerformed
        if (tope >= 2) {
            this.setEnabled(false);
            new EliminarArcos(pintar, arboles, tope, this).setVisible(true);
            jPanel1.paint(jPanel1.getGraphics());
            R_repaint(tope, arboles);
        } else {
            JOptionPane.showMessageDialog(null, "No Hay Ciudades Enlazadas... ");
        }

    }//GEN-LAST:event_jMenuItem9ActionPerformed

    private void jMenuItem10ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem10ActionPerformed
        int Eliminar = ingresarNodoOrigen("Ingrese Ciudad a Eliminar ", "Ciudad No existe", tope);
        if (Eliminar <= tope && Eliminar >= 0 && tope > 0) {
            for (int j = 0; j < tope; j++) {
                for (int k = 0; k < tope; k++) {
                    if (j == Eliminar || k == Eliminar) {
                        arboles.setmAdyacencia(j, k, -1);
                    }
                }
            }
            for (int l = 0; l < tope - 1; l++) {
                for (int m = 0; m < tope; m++) {
                    if (arboles.getmAdyacencia(l, m) == -1) {
                        arboles.setmAdyacencia(l, m, arboles.getmAdyacencia(l + 1, m));
                        arboles.setmAdyacencia(l + 1, m, -1);
                        arboles.setmCoeficiente(l, m, arboles.getmCoeficiente(l + 1, m));
                    }
                }
            }
            for (int l = 0; l < tope; l++) {
                for (int m = 0; m < tope - 1; m++) {

                    if (arboles.getmAdyacencia(l, m) == -1) {
                        arboles.setmAdyacencia(l, m, arboles.getmAdyacencia(l, m + 1));
                        arboles.setmAdyacencia(l, m + 1, -1);
                        arboles.setmCoeficiente(l, m, arboles.getmCoeficiente(l, m + 1));

                    }
                }
            }

            arboles.setCordeX(Eliminar, -10);
            arboles.setCordeY(Eliminar, -10);
            arboles.setNombre(Eliminar, -10);
            for (int j = 0; j < tope; j++) {
                for (int k = 0; k < tope - 1; k++) {
                    if (arboles.getCordeX(k) == -10) {
                        arboles.setCordeX(k, arboles.getCordeX(k + 1));
                        arboles.setCordeX(k + 1, -10);
                        arboles.setCordeY(k, arboles.getCordeY(k + 1));
                        arboles.setCordeY(k + 1, -10);
                        arboles.setNombre(k, arboles.getNombre(k + 1));
                        arboles.setNombre(k + 1, -10);
                    }
                }
            }
            for (int j = 0; j < tope; j++) {
                arboles.setNombre(j, j);// renombramos             
            }
            // eliminamos los -1 y  los -10 
            for (int j = 0; j < tope + 1; j++) {
                for (int k = 0; k < tope + 1; k++) {
                    if (arboles.getmAdyacencia(j, k) != -1) {
                        arboles.setmAdyacencia(j, k, arboles.getmAdyacencia(j, k));
                    } else {
                        arboles.setmAdyacencia(j, k, 0);
                    }
                    if (arboles.getmCoeficiente(j, k) != -10) {
                        arboles.setmCoeficiente(j, k, arboles.getmCoeficiente(j, k));
                    } else {
                        arboles.setmCoeficiente(j, k, 0);
                    }
                }
            }
            tope--;
            jPanel1.paint(jPanel1.getGraphics());
            R_repaint(tope, arboles);
        }
    }//GEN-LAST:event_jMenuItem10ActionPerformed

    private void jMenuItem11ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem11ActionPerformed
        for (int j = 0; j < tope; j++) {
            for (int k = 0; k < tope; k++) {
                arboles.setmAdyacencia(j, k, 0);
                arboles.setmAdyacencia(k, j, 0);
                arboles.setmCoeficiente(j, k, 0);
                arboles.setmCoeficiente(k, j, 0);
            }
        }
        jPanel1.paint(jPanel1.getGraphics());
        R_repaint(tope, arboles);
    }//GEN-LAST:event_jMenuItem11ActionPerformed

    private void jMenuItem8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem8ActionPerformed
        System.exit(0);
    }//GEN-LAST:event_jMenuItem8ActionPerformed

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed

        for (int j = 0; j < tope; j++) {
            arboles.setCordeX(j, 0);
            arboles.setCordeY(j, 0);
            arboles.setNombre(j, 0);
        }
        for (int j = 0; j < tope; j++) {
            for (int k = 0; k < tope; k++) {
                arboles.setmAdyacencia(j, k, 0);
                arboles.setmCoeficiente(j, k, 0);
            }
        }
        tope = 00;
        jPanel1.repaint();
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem2ActionPerformed
        if (tope <= 1) {
            JOptionPane.showMessageDialog(null, "Cree nuevo Ciudad : ");
        } else {
            this.setEnabled(false);
            new VentanaArco(arboles, pintar, tope, this).setVisible(true);
            jPanel1.paint(jPanel1.getGraphics());
            R_repaint(tope, arboles);
        }
    }//GEN-LAST:event_jMenuItem2ActionPerformed

    private void jMenuItem13ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem13ActionPerformed
        if (tope >= 2) {
            permanente = ingresarNodoOrigen("Ingrese Nodo Origen..", "Nodo Origen No existe", tope);// hacemos el llamano de la funcion
            nodoFin = ingresarNodoOrigen("Ingrese Nodo Fin..", "Nodo fin No existe", tope);
            Algoritmo_Dijkstra Dijkstra = new Algoritmo_Dijkstra(arboles, tope, permanente, nodoFin);
            Dijkstra.dijkstra();
            jTextField2.setText("" + Dijkstra.getAcumulado());
        } else {
            JOptionPane.showMessageDialog(null, "Se deben de crear mas Ciudades ... ");
        }
    }//GEN-LAST:event_jMenuItem13ActionPerformed

    private void jTextField2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField2ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField2ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {

    }
    private int tope = 0;// lleva el # de nodos creado 
    private int nodoFin;
    private int permanente;
    int n = 0, nn = 0, id, id2;// permite controlar que se halla dado click sobre un nodo
    private int aristaMayor;


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel identLabe2;
    private javax.swing.JLabel identLabel1;
    private javax.swing.JLabel ipLabe2;
    private javax.swing.JLabel ipLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem10;
    private javax.swing.JMenuItem jMenuItem11;
    private javax.swing.JMenuItem jMenuItem13;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JMenuItem jMenuItem8;
    private javax.swing.JMenuItem jMenuItem9;
    public static javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPopupMenu.Separator jSeparator1;
    private javax.swing.JPopupMenu.Separator jSeparator2;
    private javax.swing.JPopupMenu.Separator jSeparator3;
    private javax.swing.JPopupMenu.Separator jSeparator5;
    private javax.swing.JTextField jTextField2;
    private javax.swing.JLabel jmapa;
    private javax.swing.JLabel nombreLabe2;
    private javax.swing.JLabel nombreLabel1;
    // End of variables declaration//GEN-END:variables
}
