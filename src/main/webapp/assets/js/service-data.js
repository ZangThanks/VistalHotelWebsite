// Service Data Configuration
const servicesData = {
    laundry: [
        {
            name: 'Express Dry Cleaning',
            image: 'https://images.pexels.com/photos/1756957/pexels-photo-1756957.jpeg?auto=compress&cs=tinysrgb&w=400',
            rating: 4.9,
            duration: '4-6 hours',
            price: '4,200,000',
            description: 'Professional dry cleaning service with same-day delivery'
        },
        {
            name: 'Premium Laundry',
            image: 'https://images.pexels.com/photos/5591581/pexels-photo-5591581.jpeg?auto=compress&cs=tinysrgb&w=400',
            rating: 4.9,
            duration: '2-3 hours',
            price: '2,900,000',
            description: 'Professional dry cleaning service with same-day delivery'
        },
        {
            name: 'Normal Laundry',
            image: 'https://images.pexels.com/photos/4239091/pexels-photo-4239091.jpeg?auto=compress&cs=tinysrgb&w=400',
            rating: 4.9,
            duration: '7-8 hours',
            price: '1,400,000',
            description: 'Professional dry cleaning service with same-day delivery'
        },
        {
            name: 'Wet Cleaning',
            image: 'https://images.pexels.com/photos/6197119/pexels-photo-6197119.jpeg?auto=compress&cs=tinysrgb&w=400',
            rating: 4.9,
            duration: '4-6 hours',
            price: '900,000',
            description: 'Professional dry cleaning service with same-day delivery'
        },
        {
            name: 'Hand Wash',
            image: 'https://images.pexels.com/photos/5591663/pexels-photo-5591663.jpeg?auto=compress&cs=tinysrgb&w=400',
            rating: 4.9,
            duration: '2-3 hours',
            price: '1,700,000',
            description: 'Professional dry cleaning service with same-day delivery'
        },
        {
            name: 'Delicate Wash',
            image: 'https://images.pexels.com/photos/7262775/pexels-photo-7262775.jpeg?auto=compress&cs=tinysrgb&w=400',
            rating: 4.9,
            duration: '7-8 hours',
            price: '3,400,000',
            description: 'Professional dry cleaning service with same-day delivery'
        }
    ],
    food: [
        {
            name: 'Gourmet Breakfast',
            image: 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=400',
            rating: 4.9,
            duration: '30-45 min',
            price: '4,200,000',
            description: 'To awaken every sense, to elevate with exquisite flavors.'
        },
        {
            name: 'Fine Dining Experience',
            image: 'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=400',
            rating: 5.0,
            duration: '45-60 min',
            price: '8,500,000',
            description: 'To awaken every sense, to elevate with exquisite flavors.'
        },
        {
            name: 'Afternoon Tea Service',
            image: 'https://images.pexels.com/photos/1854652/pexels-photo-1854652.jpeg?auto=compress&cs=tinysrgb&w=400',
            rating: 4.9,
            duration: '45-60 min',
            price: '1,800,000',
            description: 'To awaken every sense, to elevate with exquisite flavors.'
        },
        {
            name: 'Premium Wine Selection',
            image: 'https://images.pexels.com/photos/1267360/pexels-photo-1267360.jpeg?auto=compress&cs=tinysrgb&w=400',
            rating: 4.9,
            duration: 'Anytime',
            price: '3,500,000',
            description: 'To awaken every sense, to elevate with exquisite flavors.'
        },
        {
            name: 'Fresh Fruit',
            image: 'https://images.pexels.com/photos/1132047/pexels-photo-1132047.jpeg?auto=compress&cs=tinysrgb&w=400',
            rating: 5.0,
            duration: 'Anytime',
            price: '850,000',
            description: 'To awaken every sense, to elevate with exquisite flavors.'
        },
        {
            name: 'Pho',
            image: 'https://images.pexels.com/photos/4085037/pexels-photo-4085037.jpeg?auto=compress&cs=tinysrgb&w=400',
            rating: 4.9,
            duration: '10-15 min',
            price: '3,100,000',
            description: 'To awaken every sense, to elevate with exquisite flavors.'
        }
    ]
};

// Service Card Component (Returns HTML string matching service-card.jsp style)
function createServiceCard(service) {
    return `
        <div class="service-card bg-white rounded-xl border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow duration-300 m-2">
            <!-- Hình ảnh dịch vụ -->
            <img src="${service.image}" alt="${service.name}" class="w-full h-40 object-cover">
            
            <!-- Nội dung thẻ -->
            <div class="p-4">
                <!-- Tên dịch vụ -->
                <h4 class="text-base font-semibold mb-2">${service.name}</h4>
                
                <!-- Đánh giá & Thời gian -->
                <div class="flex items-center gap-3 text-xs mb-2">
                    <span class="flex items-center text-yellow-500">
                        ⭐ ${service.rating}
                    </span>
                    <span class="flex items-center text-gray-500">
                        🕐 ${service.duration}
                    </span>
                </div>
                
                <!-- Giá tiền -->
                <div class="text-red-500 font-semibold mb-2 flex items-center gap-1 text-sm">
                    💰 ${service.price} vnđ
                </div>
                
                <!-- Mô tả -->
                <p class="text-gray-600 text-xs mb-3 line-clamp-2">${service.description}</p>
                
                <!-- Nút hành động -->
                <div class="mt-4">
                    <a href="#" class="block w-full px-8 py-3 rounded-md text-lg font-serif bg-white text-black border border-gray-300 hover:bg-[#CCBDA3] hover:text-black hover:border-transparent transition-all duration-300 text-center">
                        BOOK SERVICE
                    </a>
                </div>
            </div>
        </div>
    `;
}

// Render services to DOM
function renderServices() {
    console.log('Rendering services...'); // Debug log

    const laundryContainer = document.getElementById('laundry-services');
    const foodContainer = document.getElementById('food-services');

    if (laundryContainer) {
        console.log('Laundry container found, rendering', servicesData.laundry.length, 'items');
        const html = servicesData.laundry.map(service => createServiceCard(service)).join('');
        laundryContainer.innerHTML = html;
    } else {
        console.error('Laundry container not found!');
    }

    if (foodContainer) {
        console.log('Food container found, rendering', servicesData.food.length, 'items');
        const html = servicesData.food.map(service => createServiceCard(service)).join('');
        foodContainer.innerHTML = html;
    } else {
        console.error('Food container not found!');
    }
}

// Initialize on page load
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', renderServices);
} else {
    // DOM is already loaded
    renderServices();
}
