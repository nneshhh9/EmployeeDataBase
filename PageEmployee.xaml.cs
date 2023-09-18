using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Data.Services.Client;

namespace wpfKozhuhov
{
    /// <summary>
    /// Логика взаимодействия для PageEmployee.xaml
    /// </summary>
    public partial class PageEmployee : Page
    {
        public PageEmployee()
        {
            DataEntitiesEmployee = new TitleEmployeeEntities();
            InitializeComponent();
            ListEmployee = new ObservableCollection<Employee>();
        }

        public static TitleEmployeeEntities DataEntitiesEmployee { get; set; }
        ObservableCollection<Employee> ListEmployee = new ObservableCollection<Employee>();

        private bool isDirty = true;
        private void UndoCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            RewriteEmployee();
            DataGridEmployee.IsReadOnly = true;
            isDirty = true;
        }
        private void UndoCommandBinding_CanExecuted(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = isDirty;
        }

        private void NewCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            Employee employee = Employee.CreateEmployee(-1, "не задано", "не задано", "не задано", 0);
            try
            {
                DataEntitiesEmployee.Employees.Add(employee);
                ListEmployee.Add(employee);
                DataGridEmployee.ScrollIntoView(employee);
                DataGridEmployee.SelectedIndex = DataGridEmployee.Items.Count - 1;
                DataGridEmployee.Focus();
                DataGridEmployee.IsReadOnly = false;
                isDirty = false;
            }
            catch(DataServiceRequestException ex)
            {
                throw new ApplicationException("ошибка добавления нового сотрудника в контексте данных" + ex.ToString());
            }
        }
        private void NewCommandBinding_CanExecuted(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = isDirty;
        }

        private void EditCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            DataGridEmployee.IsReadOnly = false;
            DataGridEmployee.BeginEdit();
            isDirty = false;
        }
        private void EditCommandBinding_CanExecuted(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = isDirty;
        }

        private void SaveCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            DataEntitiesEmployee.SaveChanges();
            isDirty = true;
            DataGridEmployee.IsReadOnly = true;
        }
        private void SaveCommandBinding_CanExecuted(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = !isDirty;
        }

        private void FindCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            BorderFind.Visibility = System.Windows.Visibility.Visible;
            isDirty = false;
        }
        private void FindCommandBinding_CanExecuted(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = isDirty;
        }

        private void DeleteCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            Employee emp = DataGridEmployee.SelectedItem as Employee;
            if (emp != null)
            {
                MessageBoxResult result = MessageBox.Show("Удалиние сотрудника: " + emp.Surname.Trim() + " "
                                                          + emp.Name.Trim() + " " + emp.Patronymic.Trim(),
                                                          "Предупреждение", MessageBoxButton.OKCancel);
                if (result == MessageBoxResult.OK)
                {
                    DataEntitiesEmployee.Employees.Remove(emp);
                    DataGridEmployee.SelectedIndex = DataGridEmployee.SelectedIndex == 0 ? 1 : DataGridEmployee.SelectedIndex - 1;
                    ListEmployee.Remove(emp);
                    DataEntitiesEmployee.SaveChanges();
                }
            }
            else
            {
                MessageBox.Show("Выбрите строку для удаления");
            }
        }
        private void DeleteCommandBinding_CanExecuted(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = isDirty;
        }






        private void GetEmployees()
        {
            var employees = DataEntitiesEmployee.Employees;
            var queryEmployee = from employee in employees orderby employee.Surname select employee;
            foreach (Employee emp in queryEmployee)
            {
                ListEmployee.Add(emp);
            }
            DataGridEmployee.ItemsSource = ListEmployee;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            var employees = DataEntitiesEmployee.Employees;
            var queryEmployee = from employee in employees
                                orderby employee.Surname
                                select employee;
            foreach (Employee emp in queryEmployee)
            {
                ListEmployee.Add(emp);
            }
            DataGridEmployee.ItemsSource = ListEmployee;
        }

        private void RewriteEmployee()
        {
            DataEntitiesEmployee = new TitleEmployeeEntities();
            ListEmployee.Clear();
            GetEmployees();
        }

        private void tboxSurname_TextChanged(object sender, TextChangedEventArgs e)
        {
            bFindSurname.IsEnabled = true;
            bFindPosition.IsEnabled = false;
            cbTitle.SelectedItem = -1;
        }

        private void cbTitle_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void bFindSurname_Click(object sender, RoutedEventArgs e)
        {
            string surname = tboxSurname.Text;
            DataEntitiesEmployee = new TitleEmployeeEntities();
            var employees = DataEntitiesEmployee.Employees;
            ListEmployee.Clear();
            var queryEmployee = from employee in employees
                                where employee.Surname == surname
                                select employee;
            foreach (Employee emp in queryEmployee)
            {
                ListEmployee.Add(emp);
            }
            if (ListEmployee.Count > 0)
            {
                DataGridEmployee.ItemsSource = ListEmployee;
                bFindSurname.IsEnabled = true;
                bFindPosition.IsEnabled = false;
            }
            else
                MessageBox.Show("Сотрудник с фамилией \n" + surname + "\n не найден",
                    "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
        }

        private void bFindTitle_Click(object sender, RoutedEventArgs e)
        {
            DataEntitiesEmployee = new TitleEmployeeEntities();
            ListEmployee.Clear();

            Title title = cbTitle.SelectedItem as Title;
            var employees = DataEntitiesEmployee.Employees;
            var queryEmployee = from employee in employees
                                where employee.TitleID == title.Id
                                orderby employee.Surname
                                select employee;
            foreach (Employee emp in queryEmployee)
            {
                ListEmployee.Add(emp);
            }
            DataGridEmployee.ItemsSource = ListEmployee;
        }

        private void CommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            RewriteEmployee();
            DataGridEmployee.IsReadOnly = false;
            isDirty = true;
            BorderFind.Visibility = System.Windows.Visibility.Hidden;
        }
    }
}
