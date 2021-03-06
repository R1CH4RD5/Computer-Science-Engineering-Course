package hello2d;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Shape;
import java.awt.geom.AffineTransform;
import java.awt.geom.Ellipse2D;

import javax.swing.JApplet;
import javax.swing.JFrame;
import javax.swing.JPanel;

  public class Hello2D extends JApplet {				// Import JApplet, JFrame, JPanel. Extends to JApplet
	  public static void main(String s[]) {
		  
	    JFrame frame = new JFrame();				// Declare the JFrame
	    frame.setTitle("Hello 2D");					// JFrame title
	    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);	// Close the window operation when leaving the application
	    
	    JApplet applet = new Hello2D();				// JApplet object. 'extends JApplet'
	    applet.init();						// 'init()' method used to start the JApplet
	    
	    frame.getContentPane().add(applet);				// When we start the JApplet we want to start it into the JFrame
	    
	    frame.pack();						// Everytime we add into the JFrame, we call the pack in case of redimension/resizing
	    frame.setVisible(true);					// As default is set to 'false'
	  }
	  
	  public void init() {
	    JPanel panel = new Hello2DPanel();				// We can create another class file for Hello2DPanel or we can add it in this code as followed
	    getContentPane().add(panel);
	  }
	}

class Hello2DPanel extends JPanel {					// Import Dimension, Graphics, Graphics2D, Color, Ellipse2D, AffineTransform, Shape from java.awt 
	  public Hello2DPanel() {
	    setPreferredSize(new Dimension(640, 480));
	  }

	  public void paintComponent(Graphics g) {
	    super.paintComponent(g);
	    
	    Graphics2D g2 = (Graphics2D)g;				// Converting graphics objects with Graphics2D
	    
	    Ellipse2D e = new Ellipse2D.Double(-100, -50, 200, 100);  	// Example of Modulation (it doesn't draw nothing, it only construct the 'virtual world' on the memory of the app)
	    AffineTransform tr = new AffineTransform();			// Construction of a geometric transformation/form
	    tr.rotate(Math.PI / 6.0);					// Rotate that geometric transformation/form
	    Shape shape = tr.createTransformedShape(e);			// Create object
	    g2.translate(300,200);					// Relocate/place the coordinate system, in this case, in the center of the window
	    g2.scale(2,2);						// Scale/size of the transformation/form

	    g2.setColor(Color.blue);					// Set the color of the transformation/form
	    g2.draw(shape);						// Example of the Rendering (it draws what was modulated)
	    g2.drawString("Hello 2D", 0, 0);				// Example of the Direct Rendering (it draws a string where this one was not modulated before. It's direct.)
	  }
	}
