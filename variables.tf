###cloud vars


#variable "cloud_id" {
#  type        = string
#  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
#}

#variable "folder_id" {
#  type        = string
#  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
#}
#
#variable "default_zone" {
#  type        = string
#  default     = "ru-central1-a"
#  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
#}
#variable "default_cidr" {
#  type        = list(string)
#  default     = ["10.0.1.0/24"]
#  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
#}##
#
#variable "vpc_name" {
#  type        = string
#  default     = "develop"
#  description = "VPC network & subnet name"
#}
#
#variable "vm_web_image_family" {
#  type	      = string
#  default     = "ubuntu-2004-lts"
#  description = "Название образа диска ВМ"
#}
#
#variable "vm_web_instance_name" {
#  type        = string
#  default     = "netology-develop-platform-web"
#  description = "Название ВМ"#
#
#}
#
#variable "vm_web_instance_platform_id" { 
#  type        = string
#  default     = "standard-v3"
#  description = "Название типовой конфигурации платформы"
# 
#}
#
#variable "vm_web_instance_resources" {
#    type          = map({
#      cores         = number
#      memory        = number
#      core_fraction = number
#    })
#    default       = {
#      cores         = 2
#      memory        = 1
#      core_fraction = 20
#  }
#}
#	
#variable "vm_web_instance_scheduling_policy_preemptible" {
#  type        = bool
#  default     = true
#  description = "Включение функции прерываемая для ВМ"
#}
#
#variable "vm_web_instance_network_interface_nat" {
#  type        = bool
#  default     = true
#  description = "Включение Ната"
#}
#
#variable "vm_web_instance_metadata_serial-port-enable" {
#  type        = number
#  default     = 1
#  description = "Разрешает доступ к ВМ через серийную консоль"
#}
#
#variable "vm_web_instance_metadata_ssh_user" { 
#  type        = string
#  default     = "ubuntu"
#  description = "Указывает ssh пользователя для ВМ"
#}
#
###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH/8wMl1rXEaJF7FIcZekU/vaKffClFybWdb5ha1SQ/o i.grishunin@mfclnr.ru"
#  description = "ssh-keygen -t ed25519"
#}

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
