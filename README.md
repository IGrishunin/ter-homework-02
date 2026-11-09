# ter-homework-02
# Задача 1
Создал сервисный аккаунт и получил к нему **token**, **folder_id** и **cloud_id**, записал эти значения в переменные
```
YC_TOKEN
YC_CLOUD_ID
YC_FOLDER_ID
```
В **providers.tf** закомментировал значения **token**, **cloud_id**, **folder_id** и **sevice_account_key_file**, т.к. если они явно не указаны, то модуль провайдера берёт эти значения из переменных окружения. А **sevice_account_key_file** не нужен, т.к. получил токен сервисного аккаунта через ```yc iam create-token --impersonate-service-account-id```. Также закомментировал блоки **cloud_id** и **folder_id** в файле **variables.tf**, чтобы при выполнении ```terraform plan``` и ```terraform apply``` эти переменные не запрашивались для ручного ввода. 
Сгенерировал ssh ключи и записал его открытую часть в переменную **vms_ssh_root_key** в файле **variables.tf**.
Инициализировал проект через ```terraform init```, предварительно создав в домашнем каталоге пользователя от которого запускается terraform конфигурационный файл **.terraformrc** и добавил в него зеркало Яндекса
В **main.tf** Изменил значение **platform_id** с **standart-v4** на **standard-v3**. Опечатка была в слове standar**t**, ведь в документации Яндекса допустимые названия платформ standar**d**, также изменил v4 на v3, т.к. сейчас v4 недоступна.
Дополнительно изменил в **main.tf** в блоке resources значение **cores** с 1 до 2(минимально допустимое значение для **standard-v3**) и **core_fraction** с 5 до 20(минимально допустимое значение для **standard-v3**)
После создания ВМ подключился к ней по ssh и выполнил команду ```curl ifconfig.me```

<img width="596" height="84" alt="1" src="https://github.com/user-attachments/assets/b95f7a38-001b-400a-93de-59ffe006c639" />

Параметр ```preemptible = true``` включает настройку Прерываемая для ВМ, что снижает стоимость ВМ, но не гарантирует её постоянную работу. В случае нехватки ресурсов в текущей зоне Яндекс может такие ВМ тушить, также такие ВМ автоматически выключаются через 24 часа. 
Параметр ```core_fraction=5```, а в моём случае ```core_fraction=20``` показывают гарантированную долю процессорного времени для ВМ от ядра, т.е. при значении 20 Яндекс гарантирует, что этой ВМ всегда будет доступно хотя бы 20% производительности ядра. Это позволяет сэкономить деньги в рамках обучения

<img width="1900" height="453" alt="2" src="https://github.com/user-attachments/assets/864682d4-ca84-47b6-8053-3af76bee621d" />

# Задача 2
Вынес все значения в переменные в файл **variables.tf**. Указал дефолты и описание. После выполнения ```terraform plan``` дрифта не обнаружилось

# Задача 3
Создал отдельный файл **vmss_platform.tf**, перенёс в него переменные из **variable.tf** и переименовал их начало в **vm_db**. Заменил значения на указанные
в main.tf скопировал блок **yandex_compute_instance** и в значениях указал, что они должны обращаться к переменным с префиксом **vm_db**.
Также в **main.tf** скопировал блок **yandex_vpc_subnet** и в значених указал, что они должны обращаться к переменным с префиксом **vm_db**, так как в задании было указано, что ВМ должна быть в другой зоне, то и подсеть должна быть в такой же зоне.
В файле vms_platform.tf добавил дополнительные блоки **vm_db_zone**, **vm_db_cidr**, **vm_db_vpc_name**.

# Задача 4
<img width="869" height="175" alt="3" src="https://github.com/user-attachments/assets/a0d1765f-6fa3-40c1-946e-c8277d81f064" />

# Задача 5
Необходимые файлы добавлены в репозиторий

# Задача 6
Необходимые файлы добавлены в репозиторий

# Задача 7
1. ```local.test_list[1]```
   **staging**
2. ```length(local.test_list)```
   **3**  
3. ```local.test_map.admin```
   **John**
4. ```"${local.test_map.admin} is admin for ${local.test_list[2]} server based on OS ${local.servers[local.test_list[2]].image} with ${local.servers[local.test_list[2]].cpu} vcpu, ${local.servers[local.test_list[2]].ram} ram and ${length(local.servers[local.test_list[2]].disks)} virtual disks"```
   **John is admin for production server based on OS ubuntu-20-04 with 10 vcpu, 40 ram and 4 virtual disks**

<img width="1988" height="211" alt="7" src="https://github.com/user-attachments/assets/3f79b9fb-0853-4433-aea1-201e1886d4dd" />


# Задача 8
1. Декларация переменной
```
variable "test" {
  type = list(map(list(string)))
  default = [
    {
      "dev1" = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
        "10.0.1.7",
      ]
    },
    {
      "dev2" = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
        "10.0.2.29",
      ],
      "dev3" = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
        "10.0.2.29",
      ],

    },
    {
      "prod1" = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
        "10.0.1.30",
      ]
    }
  ]
}
```
2. ```local.test[0].dev1[0]```
   **ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117**

<img width="630" height="66" alt="9" src="https://github.com/user-attachments/assets/291456a1-63e0-415e-b585-aec7c28c6a40" />





