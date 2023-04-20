package Controller;

import Model.Task;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.ConnectionFactory;



public class TaskController {

    public void save(Task task) throws SQLException{
        String sql = "insert into tasks (ProjectID,TaskName,TaskDescription,TaskStatus,TaskNotes,Deadline,TaskCreatedAt,TaskAlteredAt) values (?,?,?,?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement statement = null;
        
        try{
            conn = ConnectionFactory.getConnection();
            //preparing the statement that will be the SQL imput
            statement = conn.prepareStatement(sql);
            statement.setInt(1, task.getIdProject()); //this line changes the first "?" in the String putting the string chosen in it's place
            statement.setString(2, task.getName());
            statement.setString(3, task.getDescription());
            statement.setBoolean(4, task.isCompleted());
            statement.setString(5, task.getNotes());
            statement.setDate(6, new Date(task.getDeadline().getTime()));
            statement.setDate(7, new Date(task.getCreatedAt().getTime()));
            statement.setDate(8, new Date(task.getUpdatedAt().getTime()));
            
            statement.execute();
        }
        catch (Exception ex){
            throw new RuntimeException("Erro ao alterar a tarefa " + ex.getMessage(), ex);
        } 
        finally {
            ConnectionFactory.closeConnection(conn,statement);
        }
    }
    
    public void update(Task task) throws SQLException{
    String sql = "update tasks set ProjectID = ?, TaskName = ?, TaskDescription = ?, TaskStatus = ?, TaskNotes = ?, Deadline = ?, TaskCreatedAt = ?, TaskAlteredAt = ?" 
            + "where id = ?" ;
        Connection conn = null;
        PreparedStatement statement = null;
        
        try{
            conn = ConnectionFactory.getConnection();
            //preparing the statement that will be the SQL imput
            statement = conn.prepareStatement(sql);
            statement.setInt(1, task.getIdProject()); //this line changes the first "?" in the String putting the string chosen in it's place
            statement.setString(2, task.getName());
            statement.setString(3, task.getDescription());
            statement.setBoolean(4, task.isCompleted());
            statement.setString(5, task.getNotes());
            statement.setDate(6, new Date(task.getDeadline().getTime()));
            statement.setDate(7, new Date(task.getCreatedAt().getTime()));
            statement.setDate(8, new Date(task.getUpdatedAt().getTime()));
            statement.setInt(9, task.getId());
            
            statement.execute();
        }
        catch (Exception ex){
            throw new RuntimeException("Erro ao atualizar a tarefa " + ex.getMessage(), ex);
        } 
        finally {
            ConnectionFactory.closeConnection(conn,statement);
        }
    }

    public void removeById(int taskId) throws SQLException{
        String sql = "delete from tasks where id = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        
        try{
            conn = ConnectionFactory.getConnection();
            //preparing the statement that will be the SQL imput
            statement = conn.prepareStatement(sql);
            statement.setInt(1, taskId); //this line changes the first "?" in the String putting the int chosen in it's place
            statement.execute();
        }
        catch (Exception e){
            throw new RuntimeException("Erro ao deletar a tarefa ");
        } 
        finally {
            ConnectionFactory.closeConnection(conn,statement);
        }        
    }

    public List<Task> getAll(int idProject){
        String sql = "select * from tasks where ProjectID = ?";
        
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Task> tasks = new ArrayList<>();
        
        try{
            conn = ConnectionFactory.getConnection();
            //preparing the statement that will be the SQL imput
            statement = conn.prepareStatement(sql);
            statement.setInt(1, idProject); //this line changes the first "?" in the String putting the int chosen in it's place
            resultSet = statement.executeQuery();
        
            while(resultSet.next()){
                Task task = new Task();
                task.setId(resultSet.getInt("TaskID"));
                task.setIdProject(resultSet.getInt("ProjectID"));
                task.setName(resultSet.getString("TaskName"));
                task.setDescription(resultSet.getString("TaskDescription"));
                task.setIsCompleted(resultSet.getBoolean("TaskStatus"));
                task.setNotes(resultSet.getString("TaskNotes"));
                task.setDeadline(resultSet.getDate("Deadline"));
                task.setCreatedAt(resultSet.getDate("TaskCreatedAt"));
                task.setUpdatedAt(resultSet.getDate("TaskAlteredAt"));
            
                tasks.add(task);
            }
            
        }
        catch (Exception e){
            throw new RuntimeException("Erro ");
        } 
        finally {
            ConnectionFactory.closeConnection(conn,statement,resultSet);
        }
        
        return tasks;
    }
}
