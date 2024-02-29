﻿using PCInventory.Database;
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
    /// Логика взаимодействия для PageDevDroping.xaml
    /// </summary>
    public partial class PageDevDroping : Page
    {
        public PageDevDroping()
        {
            InitializeComponent();
            DataGridDevDroping.ItemsSource = DatabaseEntities.GetContext().DeviceDroping.ToList();
        }
    }
}
