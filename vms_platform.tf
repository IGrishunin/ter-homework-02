##Первая ВМ
variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Название образа диска ВМ"
}

variable "vm_web_instance_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Название ВМ"
}

variable "vm_web_instance_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Название типовой конфигурации платформы"
}

variable "vm_web_instance_scheduling_policy_preemptible" {
  type        = bool
  default     = true
  description = "Включение функции прерываемая для ВМ"
}

variable "vm_web_instance_network_interface_nat" {
  type        = bool
  default     = true
  description = "Включение Ната"
}


##Вторая ВМ
variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-e"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "vm_db_vpc_name" {
  type        = string
  default     = "develop-e"
  description = "VPC network & subnet name"
}


variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Название образа диска ВМ"
}

variable "vm_db_instance_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Название ВМ"
}

variable "vm_db_instance_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Название типовой конфигурации платформы"
}

variable "vm_db_instance_scheduling_policy_preemptible" {
  type        = bool
  default     = true
  description = "Включение функции прерываемая для ВМ"
}

variable "vm_db_instance_network_interface_nat" {
  type        = bool
  default     = true
  description = "Включение Ната"
}

##Общий Блок
variable "vm_instance_resources" {
  type              = map(object({
    cores           = number
    memory          = number
    core_fraction   = number
  }))
  default           = {
    "db"            = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
    "web" = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
  }
}
 
variable "vm_instance_metadata" {
  type                   = map(object({
    serial-port-enable   = number
    ssh-user             = string
    ssh-key              = string
  }))
  default                = {
    common               = {
      serial-port-enable = 1
      ssh-user           = "ubuntu"
      ssh-key            = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH/8wMl1rXEaJF7FIcZekU/vaKffClFybWdb5ha1SQ/o i.grishunin@mfclnr.ru"
    }
  }
}
