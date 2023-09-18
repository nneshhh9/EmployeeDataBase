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
    /// Логика взаимодействия для PageSecurities.xaml
    /// </summary>
    public partial class PageSecurities : Page
    {
        public PageSecurities()
        {
            DataEntitiesSecuritie = new TitleSecuritieEntities();
            InitializeComponent();
            ListSecuritie = new ObservableCollection<Securitie>();
        }

        private bool isDirty = true;
        public static TitleSecuritieEntities DataEntitiesSecuritie { get; set; }
        ObservableCollection<Securitie> ListSecuritie = new ObservableCollection<Securitie>();

        private void UndoCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            RewriteSecuritie();
            DataGridSecuritie.IsReadOnly = true;
            isDirty = true;
        }
        private void UndoCommandBinding_CanExecuted(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = isDirty;
        }

        private void NewCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            Securitie securitie = Securitie.CreateSecuritie(-1, "не задано", "не задано", 0);
            try
            {
                DataEntitiesSecuritie.Securities.Add(securitie);
                ListSecuritie.Add(securitie);
                DataGridSecuritie.ScrollIntoView(securitie);
                DataGridSecuritie.SelectedIndex = DataGridSecuritie.Items.Count - 1;
                DataGridSecuritie.Focus();
                DataGridSecuritie.IsReadOnly = false;
                isDirty = false;
            }
            catch (DataServiceRequestException ex)
            {
                throw new ApplicationException("ошибка добавления новой биржи в контексте данных" + ex.ToString());
            }
        }
        private void NewCommandBinding_CanExecuted(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = isDirty;
        }

        private void EditCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            DataGridSecuritie.IsReadOnly = false;
            DataGridSecuritie.BeginEdit();
            isDirty = false;
        }
        private void EditCommandBinding_CanExecuted(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = isDirty;
        }

        private void SaveCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            DataEntitiesSecuritie.SaveChanges();
            isDirty = true;
            DataGridSecuritie.IsReadOnly = true;
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

        //удаление сотрудников
        private void DeleteCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            Securitie sec = DataGridSecuritie.SelectedItem as Securitie;
            if (sec != null)
            {
                MessageBoxResult result = MessageBox.Show("Удалиние биржу: " + sec.name.Trim() + " "
                                                          + " " + sec.sum.Trim(),
                                                          "Предупреждение", MessageBoxButton.OKCancel);
                if (result == MessageBoxResult.OK)
                {
                    DataEntitiesSecuritie.Securities.Remove(sec);
                    DataGridSecuritie.SelectedIndex = DataGridSecuritie.SelectedIndex == 0 ? 1 : DataGridSecuritie.SelectedIndex - 1;
                    ListSecuritie.Remove(sec);
                    DataEntitiesSecuritie.SaveChanges();
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






        private void GetSecurities()
        {
            var securities = DataEntitiesSecuritie.Securities;
            var querySecuritie = from securitie in securities orderby securitie.name select securitie;
            foreach (Securitie sec in querySecuritie)
            {
                ListSecuritie.Add(sec);
            }
            DataGridSecuritie.ItemsSource = ListSecuritie;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            var securities = DataEntitiesSecuritie.Securities;
            var querySecuritie = from securitie in securities
                                 orderby securitie.name
                                select securitie;
            foreach (Securitie sec in querySecuritie)
            {
                ListSecuritie.Add(sec);
            }
            DataGridSecuritie.ItemsSource = ListSecuritie;
        }
        
        private void RewriteSecuritie()
        {
            DataEntitiesSecuritie = new TitleSecuritieEntities();
            ListSecuritie.Clear();
            GetSecurities();
        }

        private void tboxSurname_TextChanged(object sender, TextChangedEventArgs e)
        {
            bFindName.IsEnabled = true;
            bFindPosition.IsEnabled = false;
            cbTitle.SelectedItem = -1;
        }

        private void cbTitle_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void bFindName_Click(object sender, RoutedEventArgs e)
        {
            string name = tboxSurname.Text;
            DataEntitiesSecuritie = new TitleSecuritieEntities();
            var securities = DataEntitiesSecuritie.Securities;
            ListSecuritie.Clear();
            var querySecuritie = from securitie in securities
                                 where securitie.name == name
                                select securitie;
            foreach (Securitie sec in querySecuritie)
            {
                ListSecuritie.Add(sec);
            }
            if (ListSecuritie.Count > 0)
            {
                DataGridSecuritie.ItemsSource = ListSecuritie;
                bFindName.IsEnabled = true;
                bFindPosition.IsEnabled = false;
            }
            else
                MessageBox.Show("Сотрудник с фамилией \n" + name + "\n не найден",
                    "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
        }

        private void bFindTitle_Click(object sender, RoutedEventArgs e)
        {
            DataEntitiesSecuritie = new TitleSecuritieEntities();
            ListSecuritie.Clear();

            Table table = cbTitle.SelectedItem as Table;
            var securities = DataEntitiesSecuritie.Securities;
            var querySecuritie = from securitie in securities
                                where securitie.SecuritieID == table.Id
                                orderby securitie.name
                                select securitie;
            foreach (Securitie sec in querySecuritie)
            {
                ListSecuritie.Add(sec);
            }
            DataGridSecuritie.ItemsSource = ListSecuritie;
        }

        private void CommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            RewriteSecuritie();
            DataGridSecuritie.IsReadOnly = false;
            isDirty = true;
            BorderFind.Visibility = System.Windows.Visibility.Hidden;
        }
    }
}
