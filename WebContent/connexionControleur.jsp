<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <!-- j'importe mon mod�le <nomDuPackage.nomClasse> dans mon controleur-->
    <%@ page import="connexionModele.Utilisateur"%>
    
    <!-- j'importe la biblioth�que sql -->
    <%@ page import="java.sql.*"%>
    
    <%
    	try {
    		//le contr�leur r�cup�re les informations contenues dans la vue et les stocke sous forme de variables
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
    	    	
    			//je cr�� une nouvelle instance de mon mod�le
    			Utilisateur utilisateur = new Utilisateur();
    	    	
    			//je donne � l'attribut mail de mon instance la valeur contenue dans le champ mail de ma base de donn�es
    	    	utilisateur.setMail(result.getString("mail"));
    	    	
    			//je donne � l'attribut mot_de_passe de mon instance la valeur contenue dans le champ mot_de_passe de ma base de donn�es
    	    				utilisateur.setMot_de_passe(result.getString("mot_de_passe"));
    	    	//si le mot de passe r�cup�r� de la vue correspond � celui stock� dans le mod�le et r�cup�r� de la base de donn�es
    	    	if (mot_de_passeVue.equals(utilisateur.getMot_de_passe())){
    	    		//alors je suis redirig�e vers la page login-success
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