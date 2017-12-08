/* Manuel Prada / Alexander correa 



 */
package estructuraGrafo;

import static ventanasGraficas.VentanaPrincipal.R_repaint;
import static ventanasGraficas.VentanaPrincipal.ingresarNodoOrigen;
import static ventanasGraficas.VentanaPrincipal.jPanel1;
import java.awt.Color;

/**
 *
 * @author Manuel Prada / Alexander Gutierrez
 */
public class Algoritmo_Prim {

    private int cumulado;
    private int arcoMenor;
    private int fin;
    private boolean estaVertice = false;
    private boolean aumentaTamano;
    private int nodoApuntado;
    private int nodoApuntador;
    private int tamano;
    private int arcoMayor;
    private Vertice arboles;
    private int tope;
    private int verticeOrigen;

    public Algoritmo_Prim(Vertice arbol, int top, int arcoMayor) {
        this.cumulado = 0;
        this.arcoMenor = 0;
        this.fin = 0;
        this.estaVertice = false;
        this.aumentaTamano = false;
        this.nodoApuntado = 0;
        this.nodoApuntador = 0;
        this.tamano = 1;
        this.arcoMayor = arcoMayor;
        this.arboles = arbol;
        this.tope = top;
    }

    public int getCumulado() {
        return cumulado;
    }

    public void prim() {
        this.verticeOrigen = ingresarNodoOrigen("Ingrese Ciudad Origen", "Ciudad Origen No existe", tope);
        jPanel1.paint(jPanel1.getGraphics());
        R_repaint(tope, arboles);
        arboles.crearEnArbol(tope);
        arboles.setEnArbol(0, verticeOrigen);
        //algoritmo de Prim ---->>
        do {
            this.arcoMenor = this.arcoMayor;
            this.fin = 2;
            for (int j = 0; j < tamano; j++) {
                for (int k = 0; k < tope; k++) {
                    if (arboles.getmAdyacencia(k, arboles.getEnArbol(j)) == 1) {
                        for (int h = 0; h < tamano; h++) {
                            if (arboles.getEnArbol(h) == k) {
                                this.estaVertice = true;
                                break;
                            }
                        }
                        if (estaVertice == false) {
                            if (arboles.getmCoeficiente(k, arboles.getEnArbol(j)) <= arcoMenor && arboles.getmCoeficiente(k, arboles.getEnArbol(j)) > 0) {
                                arcoMenor = arboles.getmCoeficiente(k, arboles.getEnArbol(j));
                                this.nodoApuntado = k;
                                this.aumentaTamano = true;
                                this.nodoApuntador = arboles.getEnArbol(j);
                                this.fin = 1;
                            }
                        }
                        this.estaVertice = false;
                    }
                }
            }//fin  for (int j = 0; j < tamano; j++)              
            if (aumentaTamano == true) {
                Pintar.pintarCamino(jPanel1.getGraphics(), arboles.getCordeX(nodoApuntador), arboles.getCordeY(nodoApuntador), arboles.getCordeX(nodoApuntado), arboles.getCordeY(nodoApuntado), Color.red);
                Pintar.clickSobreNodo(jPanel1.getGraphics(), arboles.getCordeX(nodoApuntador), arboles.getCordeY(nodoApuntador), null, Color.red);
                Pintar.clickSobreNodo(jPanel1.getGraphics(), arboles.getCordeX(nodoApuntado), arboles.getCordeY(nodoApuntado), null, Color.red);
                arboles.setEnArbol(tamano, nodoApuntado);
                this.tamano++;
                this.aumentaTamano = false;
                this.cumulado += this.arcoMenor;
            }
        } while (fin < 2);
    }

}
