package Controller;

import Model.Project;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.ConnectionFactory;


public class ProjectController {
    public void save (Project project){
        String sql = "insert into projects (ProjectName, ProjectDescription, CreatedAt, AlteredAt) values (?,?,?,?)";
        Connection connection = null;
        PreparedStatement statement = null;
        
        try{
            connection = ConnectionFactory.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, project.getName());
            statement.setString(2, project.getDescription());
            statement.setDate(3, new Date(project.getCreatedAt().getTime()));
            statement.setDate(4, new Date(project.getAlteredAt().getTime()));
            statement.execute();
        }
        catch(Exception ex){
            throw new RuntimeException("erro ao salvar o projeto", ex);
        }
        finally{
            ConnectionFactory.closeConnection(connection,statement);
        }
    }
    
    public void update (Project project){
        String sql = "update projects set ProjectName = ?, projectDescription = ?, CreatedAt = ?, AlteredAt = ?, where ProjectID = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        
        try{
            connection = ConnectionFactory.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, project.getName());
            statement.setString(2, project.getDescription());
            statement.setDate(3, new Date(project.getCreatedAt().getTime()));
            statement.setDate(4, new Date(project.getAlteredAt().getTime()));
            statement.setInt(5, project.getId());
            statement.execute();
        }
        catch(Exception ex){
            throw new RuntimeException("erro ao atualizar o projeto");
        }
        finally{
            ConnectionFactory.closeConnection(connection,statement);
        }
        
    }
    
    public void removeById(int projectID){
        String sql = "delete from projects where ProjectID = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        
        try{
            connection = ConnectionFactory.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, projectID);
            statement.execute();
        }
        catch(Exception ex){
            throw new RuntimeException("Erro ao excluir o projeto ");
        }
        finally{
            ConnectionFactory.closeConnection(connection,statement);
        }
        
    }
    
    public List<Project> getAll(){
        List<Project> Projects = new ArrayList<>();
        
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String sql = "get * from projects";
        
        try{
            connection = ConnectionFactory.getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            
            while(resultSet.next()){
                Project project = new Project();
                
                project.setId(resultSet.getInt("ProjectID"));
                project.setName(resultSet.getString("ProjectName"));
                project.setDescription(resultSet.getString("ProjectDescription"));
                project.setCreatedAt(resultSet.getDate("CreatedAt"));
                project.setAlteredAt(resultSet.getDate("AlteredAt"));
                
                Projects.add(project);
            }
        }
        catch(SQLException ex){
            throw new RuntimeException("Erro ao obter a lista de projetos", ex);
        }
        finally{
            ConnectionFactory.closeConnection(connection,statement,resultSet);            
        }
        return Projects;
    }
}
