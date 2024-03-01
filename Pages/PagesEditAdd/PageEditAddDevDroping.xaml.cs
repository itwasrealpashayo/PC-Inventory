using PCInventory.Database;
using PCInventory.Utility;
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

namespace PCInventory.Pages.PagesEditAdd
{
    /// <summary>
    /// Логика взаимодействия для PageEditAddDevDroping.xaml
    /// </summary>
    public partial class PageEditAddDevDroping : Page
    {
        public DeviceDroping currentDeviceDroping = new DeviceDroping();

        public PageEditAddDevDroping(DeviceDroping _selectedDeviceDroping)
        {
            InitializeComponent();
            CmbDeviceName.ItemsSource = DatabaseEntities.GetContext().Device.ToList();
            CmbUserSurname.ItemsSource = DatabaseEntities.GetContext().User.ToList();
            CmbWorkplace.ItemsSource = DatabaseEntities.GetContext().Workplace.ToList();

            if (_selectedDeviceDroping != null)
                currentDeviceDroping = _selectedDeviceDroping;
            DataContext = currentDeviceDroping;
        }

        private void DtpDevDropingDate_Loaded(object sender, RoutedEventArgs e)
        {
            DatePicker datePicker = sender as DatePicker;

            if (datePicker != null && (datePicker.SelectedDate == null || datePicker.SelectedDate == DateTime.MinValue))
            {
                datePicker.SelectedDate = DateTime.Today;
            }
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (CmbUserSurname.SelectedItem == null)
                errors.AppendLine("Укажите исполнителя списания!");
            if (CmbWorkplace.SelectedItem == null)
                errors.AppendLine("Выберите рабочее место!");
            if (DtpDevDropingDate.SelectedDate == null)
                errors.AppendLine("Укажите дату списания!");
            if (CmbDeviceName.SelectedItem == null)
                errors.AppendLine("Выберите оборудование!");
            if (string.IsNullOrEmpty(TxbDeviceDropingDefect.Text))
                errors.AppendLine("Опишите причину списания!");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (currentDeviceDroping.DeviceDropingID == 0)
            {
                try
                {
                    DatabaseEntities.GetContext().DeviceDroping.Add(currentDeviceDroping);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Ошибка",
                        MessageBoxButton.OK, MessageBoxImage.Warning);
                }
            }

            try
            {
                DatabaseEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена!", "Информация",
                    MessageBoxButton.OK, MessageBoxImage.Information);
                Manager.SecondFrame.Navigate(new PageDevDroping());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageDevDroping());
        }
    }
}
