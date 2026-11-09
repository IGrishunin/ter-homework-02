locals {
  vm_db_name  = "${var.vm_db_zone}-${var.vm_db_vpc_name}-db"
  vm_web_name = "${var.default_zone}-${var.vpc_name}-web" 
}
