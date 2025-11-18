#!/bin/sh

echo "🔧 Ajustando permissões do Laravel..."
chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache || true
chmod -R 775 /var/www/storage /var/www/bootstrap/cache || true

# Rodar composer install automaticamente se vendor não existir
if [ ! -d "/var/www/vendor" ]; then
  echo "📦 Instalando dependências do Composer..."
  composer install
fi

echo "✔️ Ambiente Laravel preparado!"
exec php-fpm
