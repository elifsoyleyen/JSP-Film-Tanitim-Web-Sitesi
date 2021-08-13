package filmsitesiii;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import filmsitesiii.sayiBilgisi;

public class veriislemler {

		private Connection con;
		private String driver="com.mysql.jdbc.Driver";
		private String url="jdbc:mysql://localhost:3306/filmsite?useUnicode=true&characterEncoding=UTF-8"; 
		private Statement stm;
		private ResultSet resultSet = null;
		private String Turadi;
		private String DuyuruBaslik;
		private String DuyuruÝcerik;
		private String filmadi;
		private String yönetmen;
		private String senaryo;
		private String oyuncular;
		private String yapim;
		private String sure;
		private String filmkonusu;

		private String videoyol;
		private int idtur;
		private String resimyol;
		private String adminka;
		private String adminsf;
		private String ÝletisimMail;
		private String ÝletisimTel;
		private String ÝletisimAdres;
		
		
		private String UyeAdi;
		private String UyeSoyadi;
		private String Uyeka;
		private String Uyesf;
		private String Uyemail;
		private String Uyeltel;


		private String yorumicerik;
		private String yorumtarih;
		private int uyeid;
		private int filmid;
		private String durum;
		

		public veriislemler()
		{
			   try {
				Class.forName(driver);
				 System.out.println("JDBC surucu basari ile yüklendi.");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			  
			try{
				con=DriverManager.getConnection(url,"root","12345");System.out.println("Veritabanýna baðlanýldý.");
				}
			catch (Exception e) { 
				System.out.println("Veri Tabanýna Baðlanýlamadý. Hata:"+e.getMessage()); System.exit(0);
				}
			try {
				stm=con.createStatement();
				}
			catch (Exception e) { 
					System.out.println("Hata:"+e.getMessage()); System.exit(0); 
			
				}
		}
		
		
		//Tür Ekleme iþlemleri---

		public boolean ekle(sayiBilgisi tur)
		{
			Turadi=tur.getTuradi();
			
			try
			{
				String query = "INSERT INTO tur(Turadi) values('"+Turadi+"')"; 
				stm.executeUpdate(query); 
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
			
		}
		
		public ResultSet selectData(int id)
		{	
			resultSet=null;
			try
			{
				String query = "SELECT * FROM tur where idTur="+id;
				resultSet=stm.executeQuery(query);

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
			
		}
		
		public ResultSet selectAllData()
		{	
			resultSet=null;
			try
			{
				String query = "SELECT idTur,Turadi FROM tur ";
				resultSet=stm.executeQuery(query);

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
		}
		
		public ResultSet selectAllDataArama(String  Turadi)
		{	
			resultSet=null;
			try
			{
				String query = "SELECT * FROM tur where Turadi="+Turadi;
				
				resultSet=stm.executeQuery(query);

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
		
			}
		public boolean deleteData(int id)
		{
			try
			{
				String query = "DELETE FROM tur WHERE idTur="+id+"";
				stm.executeUpdate(query);
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		public boolean updateData(sayiBilgisi tur,int id)
		{
			String Turadi=tur.getTuradi();
			try
			{
				String query = "UPDATE tur SET Turadi='"+Turadi+"' WHERE idTur='"+id+"'";
				stm.executeUpdate(query); 
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		
		
		
		//Duyuru iþlemleri---
		
		public boolean ekleDuyuru(sayiBilgisi duyuru)
		{
			DuyuruBaslik=duyuru.getDuyuruBaslik();
			DuyuruÝcerik=duyuru.getDuyuruÝcerik();
			
			try
			{
				String query = "INSERT INTO duyuru(DuyuruBaslik,DuyuruÝcerik) values('"+DuyuruBaslik+"','"+DuyuruÝcerik+"')"; 
				stm.executeUpdate(query); 
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
			
		}
		public ResultSet selectAllDataDuyuru()
		{	
			resultSet=null;
			try
			{
				String query = "SELECT * FROM duyuru";
				resultSet=stm.executeQuery(query);

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
		}
		public boolean deleteDataduyuru(int id)
		{
			try
			{
				String query = "DELETE FROM duyuru WHERE DuyuruID="+id+"";
				stm.executeUpdate(query);
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
	
		
		public ResultSet selectDataDuyuru(int idduyuru)
		{	
			resultSet=null;
			try
			{
				String query = "SELECT * FROM duyuru where DuyuruID="+idduyuru;
				resultSet=stm.executeQuery(query);

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
			
		}
		
		public boolean updateDataDuyuru(sayiBilgisi duyuru,int id)
		{
			String DuyuruBaslik=duyuru.getDuyuruBaslik();
			String DuyuruÝcerik=duyuru.getDuyuruÝcerik();
			try
			{
				String query = "UPDATE duyuru SET DuyuruBaslik='"+DuyuruBaslik+"',DuyuruÝcerik='"+DuyuruÝcerik+"' WHERE DuyuruID='"+id+"'";
				stm.executeUpdate(query); 
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		//Film ekle-sil-güncelle
		public ResultSet selectAllDataFilm()
		{	
			resultSet=null;
			try
			{
				String query = "SELECT * FROM film";
				resultSet=stm.executeQuery(query);

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
		}
		
	
		public ResultSet aramayapmafilm(String filmadi)
		{
			
			resultSet=null;
			try
			{
				
				
				String query ="SELECT film.idfilm, film.filmadi, film.yönetmen, film.senaryo,film.yapim,film.sure,film.oyuncular,film.filmkonusu, tur.Turadi, film.resimyol, film.videoyol FROM film INNER JOIN tur ON film.idtur=tur.idTur WHERE filmadi LIKE '%"+filmadi+"%'";

				
				
				resultSet=stm.executeQuery(query);
				
				
			
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); }
			
			return resultSet;

			
		}
		
		
		
		public boolean eklefilm(sayiBilgisi film)
		{
			filmadi=film.getfilmadi();
			yönetmen=film.getyönetmen();
			senaryo=film.getsenaryo();
			yapim=film.getyapim();
			sure=film.getsure();
			oyuncular=film.getoyuncular();
			filmkonusu=film.getfilmkonusu();
			idtur=film.getidtur();
			resimyol=film.getresimyol();
			videoyol=film.getvideoyol();
			
			
			try
			{
				String query ="INSERT INTO film(filmadi,yönetmen,senaryo,yapim,sure,oyuncular,filmkonusu,idtur,resimyol,videoyol) values ('"+filmadi+"','"+yönetmen+"','"+senaryo+"','"+yapim+"','"+sure+"','"+oyuncular+"','"+filmkonusu+"','"+idtur+"','"+resimyol+"','"+videoyol+"')"; 
				stm.executeUpdate(query); 
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
			
		}
		
		public ResultSet AraFilm(sayiBilgisi film)
		{	
			
			String filmadi=film.getfilmadi();
			resultSet=null;
			try
			{
				String query = "SELECT * FROM film WHERE Filmadi like='"+filmadi+"'" ;
				resultSet=stm.executeQuery(query);

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
		}
		public ResultSet selectAllDatafilm()
		{	
			resultSet=null;
			try
			{
				String query ="SELECT film.idfilm, film.filmadi, film.yönetmen, film.senaryo,film.yapim,film.sure,film.oyuncular,film.filmkonusu, tur.Turadi, film.resimyol, film.videoyol FROM film INNER JOIN tur ON film.idtur=tur.idTur";
				
				resultSet=stm.executeQuery(query);

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
		}

		
		public ResultSet selectDatafilm(int id)
		{	
			resultSet=null;
			try
			{
				String query = "SELECT * FROM film where idfilm="+id;
				
				resultSet=stm.executeQuery(query);

			}
			
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
			
		}
		public ResultSet selectDatadeneme()
		{	
			resultSet=null;
			try
			{
				String query = "SELECT film.idfilm, tur.idTur, tur.Turadi FROM tur INNER JOIN film ON film.idtur=tur.idTur";
				resultSet=stm.executeQuery(query);

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
			
		}
		public ResultSet selectAllDatadene()
		{	
			resultSet=null;
			try
			{
				String query = "SELECT film.idtur, tur.idTur , tur.Turadi FROM tur,film";
			
				resultSet=stm.executeQuery(query);

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
		}
		
		public boolean updateDatafilm(sayiBilgisi film,int id)
		{
			filmadi=film.getfilmadi();
			yönetmen=film.getyönetmen();
			senaryo=film.getsenaryo();
			yapim=film.getyapim();
			sure=film.getsure();
			oyuncular=film.getoyuncular();
			filmkonusu=film.getfilmkonusu();
			idtur=film.getidtur();
			resimyol=film.getresimyol();
			videoyol=film.getvideoyol();
			

			try
			{
				String query = "UPDATE film SET filmadi='"+filmadi+"',yönetmen='"+yönetmen+"',senaryo='"+senaryo+"',yapim='"+yapim+"',sure='"+sure+"',oyuncular='"+oyuncular+"',filmkonusu='"+filmkonusu+"',idtur='"+idtur+"',resimyol='"+resimyol+"',videoyol='"+videoyol+"' WHERE idfilm='"+id+"'";
				stm.executeUpdate(query); 
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		
		
		public boolean deleteDatafilm(int id)
		{
			try
			{
				String query = "DELETE FROM film WHERE idfilm="+id+"";
				stm.executeUpdate(query);
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		//sifre islemleri
		
		public ResultSet selectsifre(String mail)
		{	
			resultSet=null;
			try
			{
				String query = "SELECT adminsf FROM admingiris where mail='"+mail+"'";
				resultSet=stm.executeQuery(query);

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
			
		}
		
		
		public boolean adminekle(sayiBilgisi uye)
		{
			adminka=uye.getadminka();
			adminsf=uye.getadminsf();
			String mail=uye.getmail();
			
		
			try
			{
				String query = "INSERT INTO admingiris(adminka,adminsf,mail) values('"+adminka+"','"+adminsf+"','"+mail+"')"; 
				stm.executeUpdate(query); 
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
			
		}
	
		public ResultSet selectDatakullanici()
		{	
			resultSet=null;
			try
			{
				String query = "SELECT * FROM admingiris";
				resultSet=stm.executeQuery(query);
				

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
			
		}
		
		public ResultSet selectDatauyeler()
		{	
			resultSet=null;
			try
			{
				String query = "SELECT * FROM uyeler";
				resultSet=stm.executeQuery(query);
				

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
			
		}
		public ResultSet selectDatakullanicii(int id)
		{	
			resultSet=null;
			try
			{
				String query = "select adminka,adminsf from admingiris  WHERE idadmingiris='"+id+"'";
				resultSet=stm.executeQuery(query);
				

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
			
		}
		
		public ResultSet selectDatauyelerr(int id)
		{	
			resultSet=null;
			try
			{
				String query = "SELECT * FROM uyeler WHERE UyeID='"+id+"'";
				resultSet=stm.executeQuery(query);
				

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
			
		}
		
		
		public ResultSet selectDataadmin(int id)
		{	
			resultSet=null;
			try
			{
				String query = "SELECT * FROM admingiris WHERE idadmingiris='"+id+"'";
				resultSet=stm.executeQuery(query);
				

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
			
		}
		
		
		
		
		
		
		public boolean updateDataAdmin(sayiBilgisi admin,int id)
		{
			String adminka=admin.getadminka();
			String adminsf=admin.getadminsf();
			try
			{
				String query = "UPDATE admingiris SET adminsf='"+adminsf+"' WHERE idadmingiris='"+id+"'";
				stm.executeUpdate(query); 
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		
		//iletisim ekle/sil/güncelle
		
		public boolean iletisimekle(sayiBilgisi iletisim)
		{
			ÝletisimMail=iletisim.getÝletisimMail();
			ÝletisimTel=iletisim.getÝletisimTel();
			ÝletisimAdres=iletisim.getÝletisimAdres();
			
			try
			{
				String query = "INSERT INTO iletisim(ÝletisimMail,ÝletisimTel,ÝletisimAdres) values('"+ÝletisimMail+"','"+ÝletisimTel+"','"+ÝletisimAdres+"')"; 
				stm.executeUpdate(query); 
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
			
		}
		
		public boolean deleteDatailetisim(int id)
		{
			try
			{
				String query = "DELETE FROM iletisim WHERE ÝletisimID="+id+"";
				stm.executeUpdate(query);
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		public ResultSet selectAllDatailetisim()
		{	
			resultSet=null;
			try
			{
				String query = "SELECT * FROM iletisim";
				resultSet=stm.executeQuery(query);

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
		}
		
		public ResultSet selectDatailetisim(int idduyuru)
		{	
			resultSet=null;
			try
			{
				String query = "SELECT * FROM iletisim where iletisimID="+idduyuru;
				resultSet=stm.executeQuery(query);

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
			
		}
		
		public boolean updateDatailetisim(sayiBilgisi iletisim,int id)
		{
			String ÝletisimMail=iletisim.getÝletisimMail();
			String ÝletisimTel=iletisim.getÝletisimTel();
			String ÝletisimAdres=iletisim.getÝletisimAdres();
			try
			{
				String query = "UPDATE iletisim SET ÝletisimMail='"+ÝletisimMail+"',ÝletisimTel='"+ÝletisimTel+"',ÝletisimAdres='"+ÝletisimAdres+"' WHERE iletisimID='"+id+"'";
				stm.executeUpdate(query); 
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		
		public ResultSet uyelerlistele()
		{	
			resultSet=null;
			try
			{
				String query = "SELECT * FROM uyeler";
				resultSet=stm.executeQuery(query);

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
		}
		
		public boolean uyelerekle(sayiBilgisi uye)
		{
			UyeAdi=uye.getUyeAdi();
			UyeSoyadi=uye.getUyeSoyadi();
			Uyeka=uye.getUyeka();
			Uyesf=uye.getUyesf();
			Uyemail=uye.getUyemail();
			Uyeltel=uye.getUyeltel();
			try
			{
				String query = "INSERT INTO uyeler(UyeAdi,UyeSoyadi,Uyeka,Uyesf,Uyemail,Uyeltel) values('"+UyeAdi+"','"+UyeSoyadi+"','"+Uyeka+"','"+Uyesf+"','"+Uyemail+"','"+Uyeltel+"')"; 
				stm.executeUpdate(query); 
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
			
		}
		
		public ResultSet selectDatauyeler(int id)
		{	
			resultSet=null;
			try
			{
				String query = "select Uyesf from uyeler  WHERE UyeID='"+id+"'";
				resultSet=stm.executeQuery(query);
				

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
			
			
		}
		
		public boolean updateDataUye(sayiBilgisi uye,int id)
		{
			
			String Uyesf=uye.getUyesf();
			try
			{
				String query = "UPDATE uyeler SET Uyesf='"+Uyesf+"' WHERE UyeID='"+id+"'";
				stm.executeUpdate(query); 
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
	
		
		public boolean updateDataUyee(sayiBilgisi uye,int id)
		{
			
			String UyeAdi=uye.getUyeAdi();
			String UyeSoyadi=uye.getUyeSoyadi();
			String Uyeka=uye.getUyeka();
			String Uyemail=uye.getUyemail();
			try
			{
				String query = "UPDATE uyeler SET Uyeadi='"+UyeAdi+"',UyeSoyadi='"+UyeSoyadi+"',Uyeka='"+Uyeka+"',Uyemail='"+Uyemail+"' WHERE UyeID='"+id+"'";
				stm.executeUpdate(query); 
				return true;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		

	public boolean deletedeneme(int id)
		{
			try
		{
				String query = "SELECT yenifilm.idyenifilm, yenifilm.filmadi, yenifilm.yönetmen, yenifilm.senaryo, yenifilm.resimyol, yenifilm.videoyol ,tur.idtur, tur.Turadi FROM yenifilm INNER JOIN tur ON yenifilm.idtur=tur.idTur";
			
				stm.executeUpdate(query);
			
				return true;
			}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
	}
	
	
	
	public boolean ekleyorum(sayiBilgisi yorum)
	{
		yorumicerik=yorum.getyorumicerik();
		uyeid=yorum.getuyeid();
		filmid=yorum.getfilmid();
		yorumtarih=yorum.getyorumtarih();
		durum=yorum.getdurum();
	
		
		
		try
		{
			String query ="INSERT INTO yorum(yorumicerik,uyeid,filmid,yorumtarih,durum) values ('"+yorumicerik+"','"+uyeid+"','"+filmid+"','"+yorumtarih+"','"+durum+"')"; 
			stm.executeUpdate(query); 
			return true;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
		
	}
	
	public boolean deleteDatayorum(int id)
	{
		try
		{
			String query = "DELETE FROM yorum WHERE idyorum="+id+"";
			stm.executeUpdate(query);
			return true;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
		
	}
	public ResultSet selectAllDatayorum()
	{	
		resultSet=null;
		try
		{
			String query ="SELECT yorum.idYorum,yorum.yorumtarih,yorum.durum,yorum.yorumicerik,uyeler.UyeAdi,film.idfilm FROM yorum INNER JOIN uyeler ON yorum.uyeid=uyeler.UyeID INNER JOIN film ON yorum.filmid=film.idfilm";
			
			
			resultSet=stm.executeQuery(query);

		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
	}
	
	public ResultSet selectDatayorum(int idyorum)
	{	
		resultSet=null;
		try
		{
			String query = "SELECT * FROM yorum where idYorum="+idyorum;
			resultSet=stm.executeQuery(query);

		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
		
	}
	
	

	public boolean updateDatayorum(sayiBilgisi yorum,int id)
	{
		yorumicerik=yorum.getyorumicerik();
		uyeid=yorum.getuyeid();
		filmid=yorum.getfilmid();
		yorumtarih=yorum.getyorumtarih();
		durum=yorum.getdurum();
		try
		{
			String query = "UPDATE yorum SET durum='"+durum+"' WHERE idYorum='"+id+"'";
			stm.executeUpdate(query); 
			return true;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
		
	}
	

	public ResultSet selectAllDatayorumlar()
	{	
		resultSet=null;
		try
		{
			String query ="SELECT yorum.idyorum,yorum.yorumicerik, yorum.yorumtarih,yorum.durum,yorum.filmid,film.filmadi FROM yorum INNER JOIN film ON  yorum.filmid=film.idfilm";
			
			
			resultSet=stm.executeQuery(query);

		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
	}
	

}
