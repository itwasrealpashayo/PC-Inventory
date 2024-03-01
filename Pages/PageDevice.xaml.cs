﻿using PCInventory.Database;
using PCInventory.Pages.PagesEditAdd;
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

namespace PCInventory.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageDevices.xaml
    /// </summary>
    public partial class PageDevice : Page
    {

        public PageDevice()
        {
            InitializeComponent();
            DataGridDevice.ItemsSource = DatabaseEntities.GetContext().Device.ToList();

        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.SecondFrame.Navigate(new Pages.PagesEditAdd.PageEditAddDevice(null));
            
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            var ObjectForEdit = DataGridDevice.SelectedItem;
            Manager.SecondFrame.Navigate(new PageEditAddDevice((Device)ObjectForEdit));
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            var ObjectForDelete = DataGridDevice.SelectedItems.Cast<Device>().ToList();

            if (MessageBox.Show($"Вы действительно хотите удалить {ObjectForDelete.Count()} элемент", "Внимание", 
                    MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    DatabaseEntities.GetContext().Device.RemoveRange(ObjectForDelete);
                    DatabaseEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены");

                    DataGridDevice.ItemsSource = DatabaseEntities.GetContext().Device.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }
    }
}
