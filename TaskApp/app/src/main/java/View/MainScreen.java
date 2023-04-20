    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package View;

import java.awt.Color;
import java.awt.Font;

/**
 *
 * @author mptri
 */
public class MainScreen extends javax.swing.JFrame {

    /**
     * Creates new form MainScreen
     */
    public MainScreen() {
        initComponents();
        decorateTableTask();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        EmptyTasks = new javax.swing.JPanel();
        EmptyTaskImage = new javax.swing.JLabel();
        EmptyTaskText = new javax.swing.JLabel();
        EmptyTaskSugestion = new javax.swing.JLabel();
        Toolbar = new javax.swing.JPanel();
        ToolbarLogo = new javax.swing.JLabel();
        ToolbarPhrase = new javax.swing.JLabel();
        Projects = new javax.swing.JPanel();
        ProjectsTitle = new javax.swing.JLabel();
        ProjectsButton = new javax.swing.JLabel();
        Tasks = new javax.swing.JPanel();
        TasksName = new javax.swing.JLabel();
        TasksButton = new javax.swing.JLabel();
        ProjectsList = new javax.swing.JPanel();
        ProjectsListItems = new javax.swing.JScrollPane();
        jList1 = new javax.swing.JList<>();
        TasksListPanel = new javax.swing.JPanel();
        TaskScrollPane = new javax.swing.JScrollPane();
        TaskTable = new javax.swing.JTable();

        EmptyTasks.setBackground(new java.awt.Color(255, 255, 255));

        EmptyTaskImage.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        EmptyTaskImage.setIcon(new javax.swing.ImageIcon(getClass().getResource("/lists.png"))); // NOI18N

        EmptyTaskText.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        EmptyTaskText.setForeground(new java.awt.Color(255, 51, 51));
        EmptyTaskText.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        EmptyTaskText.setText("Nenhuma tarefa (por enquanto)");

        EmptyTaskSugestion.setForeground(new java.awt.Color(153, 153, 153));
        EmptyTaskSugestion.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        EmptyTaskSugestion.setText("Clique no botão + para adicionar uma nova tarefa");

        javax.swing.GroupLayout EmptyTasksLayout = new javax.swing.GroupLayout(EmptyTasks);
        EmptyTasks.setLayout(EmptyTasksLayout);
        EmptyTasksLayout.setHorizontalGroup(
            EmptyTasksLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(EmptyTasksLayout.createSequentialGroup()
                .addGroup(EmptyTasksLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(EmptyTaskImage, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(EmptyTasksLayout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(EmptyTaskText, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addComponent(EmptyTaskSugestion, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        EmptyTasksLayout.setVerticalGroup(
            EmptyTasksLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(EmptyTasksLayout.createSequentialGroup()
                .addGap(79, 79, 79)
                .addComponent(EmptyTaskImage)
                .addGap(18, 18, 18)
                .addComponent(EmptyTaskText)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(EmptyTaskSugestion)
                .addGap(139, 139, 139))
        );

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setMinimumSize(new java.awt.Dimension(600, 800));

        Toolbar.setBackground(new java.awt.Color(255, 51, 51));

        ToolbarLogo.setFont(new java.awt.Font("Segoe UI", 1, 48)); // NOI18N
        ToolbarLogo.setForeground(new java.awt.Color(255, 255, 255));
        ToolbarLogo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/tick.png"))); // NOI18N
        ToolbarLogo.setText("To do APP");

        ToolbarPhrase.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        ToolbarPhrase.setForeground(new java.awt.Color(255, 255, 255));
        ToolbarPhrase.setText("Se organize, não se esqueça");

        javax.swing.GroupLayout ToolbarLayout = new javax.swing.GroupLayout(Toolbar);
        Toolbar.setLayout(ToolbarLayout);
        ToolbarLayout.setHorizontalGroup(
            ToolbarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(ToolbarLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(ToolbarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(ToolbarLogo, javax.swing.GroupLayout.DEFAULT_SIZE, 735, Short.MAX_VALUE)
                    .addComponent(ToolbarPhrase, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        ToolbarLayout.setVerticalGroup(
            ToolbarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(ToolbarLayout.createSequentialGroup()
                .addGap(40, 40, 40)
                .addComponent(ToolbarLogo)
                .addGap(18, 18, 18)
                .addComponent(ToolbarPhrase)
                .addContainerGap(18, Short.MAX_VALUE))
        );

        Projects.setBackground(new java.awt.Color(255, 255, 255));
        Projects.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        ProjectsTitle.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        ProjectsTitle.setForeground(new java.awt.Color(255, 51, 51));
        ProjectsTitle.setText("Projetos");

        ProjectsButton.setIcon(new javax.swing.ImageIcon(getClass().getResource("/add.png"))); // NOI18N

        javax.swing.GroupLayout ProjectsLayout = new javax.swing.GroupLayout(Projects);
        Projects.setLayout(ProjectsLayout);
        ProjectsLayout.setHorizontalGroup(
            ProjectsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(ProjectsLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(ProjectsTitle, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 72, Short.MAX_VALUE)
                .addComponent(ProjectsButton)
                .addContainerGap())
        );
        ProjectsLayout.setVerticalGroup(
            ProjectsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(ProjectsLayout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addGroup(ProjectsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(ProjectsButton)
                    .addComponent(ProjectsTitle))
                .addContainerGap(36, Short.MAX_VALUE))
        );

        Tasks.setBackground(new java.awt.Color(255, 255, 255));
        Tasks.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        TasksName.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        TasksName.setForeground(new java.awt.Color(255, 51, 51));
        TasksName.setText("Tarefas");

        TasksButton.setIcon(new javax.swing.ImageIcon(getClass().getResource("/add.png"))); // NOI18N

        javax.swing.GroupLayout TasksLayout = new javax.swing.GroupLayout(Tasks);
        Tasks.setLayout(TasksLayout);
        TasksLayout.setHorizontalGroup(
            TasksLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(TasksLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(TasksName, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(TasksButton)
                .addContainerGap())
        );
        TasksLayout.setVerticalGroup(
            TasksLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(TasksLayout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addGroup(TasksLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(TasksButton)
                    .addComponent(TasksName))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        ProjectsList.setBackground(new java.awt.Color(255, 255, 255));
        ProjectsList.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jList1.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jList1.setModel(new javax.swing.AbstractListModel<String>() {
            String[] strings = { "Item 1", "Item 2", "Item 3", "Item 4", "Item 5" };
            public int getSize() { return strings.length; }
            public String getElementAt(int i) { return strings[i]; }
        });
        jList1.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);
        jList1.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jList1.setFixedCellHeight(40);
        jList1.setSelectionBackground(new java.awt.Color(255, 51, 51));
        ProjectsListItems.setViewportView(jList1);

        javax.swing.GroupLayout ProjectsListLayout = new javax.swing.GroupLayout(ProjectsList);
        ProjectsList.setLayout(ProjectsListLayout);
        ProjectsListLayout.setHorizontalGroup(
            ProjectsListLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(ProjectsListLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(ProjectsListItems)
                .addContainerGap())
        );
        ProjectsListLayout.setVerticalGroup(
            ProjectsListLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(ProjectsListLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(ProjectsListItems)
                .addContainerGap())
        );

        TasksListPanel.setBackground(new java.awt.Color(255, 255, 255));
        TasksListPanel.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        TaskTable.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        TaskTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Nome", "Descrição", "Prazo", "Concluido"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Boolean.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, true
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        TaskTable.setGridColor(new java.awt.Color(255, 51, 51));
        TaskTable.setRowHeight(40);
        TaskTable.setSelectionBackground(new java.awt.Color(255, 102, 102));
        TaskTable.setShowGrid(false);
        TaskTable.setShowHorizontalLines(true);
        TaskScrollPane.setViewportView(TaskTable);

        javax.swing.GroupLayout TasksListPanelLayout = new javax.swing.GroupLayout(TasksListPanel);
        TasksListPanel.setLayout(TasksListPanelLayout);
        TasksListPanelLayout.setHorizontalGroup(
            TasksListPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(TasksListPanelLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(TaskScrollPane)
                .addContainerGap())
        );
        TasksListPanelLayout.setVerticalGroup(
            TasksListPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(TasksListPanelLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(TaskScrollPane, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(Toolbar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(ProjectsList, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Projects, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(Tasks, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGap(2, 2, 2))
                    .addComponent(TasksListPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(Toolbar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(Tasks, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Projects, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(ProjectsList, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(TasksListPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(6, 6, 6))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Java swing".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MainScreen.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MainScreen.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MainScreen.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MainScreen.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainScreen().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel EmptyTaskImage;
    private javax.swing.JLabel EmptyTaskSugestion;
    private javax.swing.JLabel EmptyTaskText;
    private javax.swing.JPanel EmptyTasks;
    private javax.swing.JPanel Projects;
    private javax.swing.JLabel ProjectsButton;
    private javax.swing.JPanel ProjectsList;
    private javax.swing.JScrollPane ProjectsListItems;
    private javax.swing.JLabel ProjectsTitle;
    private javax.swing.JScrollPane TaskScrollPane;
    private javax.swing.JTable TaskTable;
    private javax.swing.JPanel Tasks;
    private javax.swing.JLabel TasksButton;
    private javax.swing.JPanel TasksListPanel;
    private javax.swing.JLabel TasksName;
    private javax.swing.JPanel Toolbar;
    private javax.swing.JLabel ToolbarLogo;
    private javax.swing.JLabel ToolbarPhrase;
    private javax.swing.JList<String> jList1;
    // End of variables declaration//GEN-END:variables
    
    public void decorateTableTask(){
        //Customizando o cabeçalho da Tabela de tarefas
        TaskTable.getTableHeader().setFont(new Font("Segoe UI",Font.BOLD,14));
        TaskTable.getTableHeader().setBackground(Color.red);
        TaskTable.getTableHeader().setForeground(Color.WHITE);
        
        //Criando ordenador para as colunas da tabela de tarefas
        TaskTable.setAutoCreateRowSorter(true);
    }

}
