<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <!-- j'importe mon modèle <nomDuPackage.nomClasse> dans mon controleur-->
    <%@ page import="connexionModele.Utilisateur"%>
    
    <!-- j'importe la bibliothèque sql -->
    <%@ page import="java.sql.*"%>
    
    <%
    	try {
    		//le contrôleur récupère les informations contenues dans la vue et les stocke sous forme de variables
    		String mailVue = request.getParameter("mailVue");
    		String mot_de_passeVue = request.getParameter("mot_de_passeVue");
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		
    		String url = "jdbc:mysql://localhost:3306/buvette_tech";
    		String user = "root";
    		String pwd = "Password29";
    		
    		Connection con = DriverManager.getConnection(url, user, pwd);

    		//create statement
    		Statement st = con.createStatement();
    		//execute query
    		ResultSet result = st.executeQuery("SELECT * FROM utilisateur");
    		
    		while (result.next()) {
    	    	
    			//je créé une nouvelle instance de mon modèle
    			Utilisateur utilisateur = new Utilisateur();
    	    	
    			//je donne à l'attribut mail de mon instance la valeur contenue dans le champ mail de ma base de données
    	    	utilisateur.setMail(result.getString("mail"));
    	    	
    			//je donne à l'attribut mot_de_passe de mon instance la valeur contenue dans le champ mot_de_passe de ma base de données
    	    				utilisateur.setMot_de_passe(result.getString("mot_de_passe"));
    	    	//si le mot de passe récupéré de la vue correspond à celui stocké dans le modèle et récupéré de la base de données
    	    	if (mot_de_passeVue.equals(utilisateur.getMot_de_passe())){
    	    		//alors je suis redirigée vers la page login-success
    	    				    %>
    	    								<jsp:forward page="login-success.jsp"></jsp:forward>
    	    								<% 
    	    							}
    	    		}
    		
    		

	}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
	}
	
	%>