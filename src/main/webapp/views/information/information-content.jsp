<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/10/2025
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<div class="container mx-auto">
  <!-- Main Content -->
  <main class="w-full">
    <div class="content">
      <!-- Content Header -->
      <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 mb-6">
        <h1 class="text-2xl font-playfair font-semibold">Hotel Information Management</h1>
        <button
                class="px-4 py-2.5 bg-color-gold text-color-white border-none rounded-md cursor-pointer flex items-center gap-2 transition-all hover:bg-opacity-90 font-medium"
                onclick="location.href='hotel-add-info.jsp'"
        >
          <i class="fas fa-plus"></i> <span>Add New Information</span>
        </button>
      </div>

      <!-- Statistics Cards -->
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
        <!-- Info Pages Card -->
        <div class="bg-color-white p-5 rounded-md shadow-sm flex items-center gap-4 transition-all hover:translate-y-[-3px] hover:shadow-md">
          <div class="w-[50px] h-[50px] rounded-full flex items-center justify-center bg-[rgba(204,189,163,0.2)]">
            <i class="fas fa-align-left text-color-gold text-xl"></i>
          </div>
          <div>
            <h3 class="text-2xl font-playfair mb-1">12</h3>
            <p class="text-gray-600 text-sm">Information Pages</p>
          </div>
        </div>

        <!-- Images Card -->
        <div class="bg-color-white p-5 rounded-md shadow-sm flex items-center gap-4 transition-all hover:translate-y-[-3px] hover:shadow-md">
          <div class="w-[50px] h-[50px] rounded-full flex items-center justify-center bg-[rgba(33,150,243,0.2)]">
            <i class="fas fa-image text-color-info text-xl"></i>
          </div>
          <div>
            <h3 class="text-2xl font-playfair mb-1">48</h3>
            <p class="text-gray-600 text-sm">Images</p>
          </div>
        </div>

        <!-- Views Card -->
        <div class="bg-color-white p-5 rounded-md shadow-sm flex items-center gap-4 transition-all hover:translate-y-[-3px] hover:shadow-md">
          <div class="w-[50px] h-[50px] rounded-full flex items-center justify-center bg-[rgba(0,200,83,0.2)]">
            <i class="fas fa-eye text-color-success text-xl"></i>
          </div>
          <div>
            <h3 class="text-2xl font-playfair mb-1">5,280</h3>
            <p class="text-gray-600 text-sm">Monthly Views</p>
          </div>
        </div>

        <!-- Last Updated Card -->
        <div class="bg-color-white p-5 rounded-md shadow-sm flex items-center gap-4 transition-all hover:translate-y-[-3px] hover:shadow-md">
          <div class="w-[50px] h-[50px] rounded-full flex items-center justify-center bg-[rgba(236,64,122,0.2)]">
            <i class="fas fa-clock text-[#EC407A] text-xl"></i>
          </div>
          <div>
            <h3 class="text-2xl font-playfair mb-1">15 days</h3>
            <p class="text-gray-600 text-sm">Last Updated</p>
          </div>
        </div>
      </div>

      <!-- Filter Container -->
      <div class="bg-color-white p-5 rounded-md mb-5 flex flex-wrap gap-4 items-end shadow-sm">
        <div class="flex flex-col w-full sm:w-auto sm:min-w-[180px]">
          <label class="mb-1 text-sm text-gray-600">Category:</label>
          <select class="p-2.5 border border-color-cream rounded-md bg-color-white outline-none transition-all focus:border-color-gold">
            <option>All Categories</option>
            <option>About Us</option>
            <option>Facilities</option>
            <option>Services</option>
            <option>History</option>
            <option>Awards</option>
          </select>
        </div>
        <div class="flex flex-col w-full sm:w-auto sm:min-w-[180px]">
          <label class="mb-1 text-sm text-gray-600">Status:</label>
          <select class="p-2.5 border border-color-cream rounded-md bg-color-white outline-none transition-all focus:border-color-gold">
            <option>All Status</option>
            <option>Published</option>
            <option>Draft</option>
            <option>Archived</option>
          </select>
        </div>
        <div class="flex flex-col w-full sm:w-auto sm:min-w-[180px]">
          <label class="mb-1 text-sm text-gray-600">Sort By:</label>
          <select class="p-2.5 border border-color-cream rounded-md bg-color-white outline-none transition-all focus:border-color-gold">
            <option>Last Updated</option>
            <option>Title (A-Z)</option>
            <option>Oldest First</option>
            <option>Most Views</option>
          </select>
        </div>
        <button class="w-full sm:w-auto px-5 py-2.5 bg-color-black text-color-white border-none rounded-md cursor-pointer transition-all hover:bg-opacity-80">Apply Filter</button>
      </div>

      <!-- Info Cards Container -->
      <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-5 mb-8">
        <!-- Card 1 -->
        <div class="bg-color-white rounded-md overflow-hidden shadow-sm transition-all hover:translate-y-[-5px] hover:shadow-lg h-full flex flex-col">
          <div class="h-[200px] bg-cover bg-center relative" style="background-image: url('https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80');">
            <span class="absolute top-4 right-4 py-1 px-2.5 rounded-full text-xs font-medium bg-color-success text-white">Published</span>
          </div>
          <div class="p-5 flex-grow flex flex-col">
            <h3 class="mb-2.5 text-xl font-playfair text-color-black">About Vista Hotel</h3>
            <p class="text-color-gold text-sm mb-2.5"><i class="fas fa-tag"></i> About Us</p>
            <p class="text-gray-600 mb-4 leading-relaxed flex-grow">Vista Hotel is a luxury 5-star establishment located in the heart of the city, offering exceptional service and accommodation...</p>
            <div class="flex justify-between text-gray-400 text-xs mb-4">
              <span><i class="fas fa-calendar-alt"></i> Updated: 05 Jun 2023</span>
              <span><i class="fas fa-eye"></i> 1,245 views</span>
            </div>
            <div class="flex gap-2.5 justify-end">
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-black cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">
                <i class="fas fa-eye"></i>
              </button>
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-black cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">
                <i class="fas fa-edit"></i>
              </button>
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-danger cursor-pointer transition-all hover:bg-[rgba(244,67,54,0.1)] flex items-center justify-center">
                <i class="fas fa-trash-alt"></i>
              </button>
            </div>
          </div>
        </div>

        <!-- Card 2 -->
        <div class="bg-color-white rounded-md overflow-hidden shadow-sm transition-all hover:translate-y-[-5px] hover:shadow-lg h-full flex flex-col">
          <div class="h-[200px] bg-cover bg-center relative" style="background-image: url('https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80');">
            <span class="absolute top-4 right-4 py-1 px-2.5 rounded-full text-xs font-medium bg-color-success text-white">Published</span>
          </div>
          <div class="p-5 flex-grow flex flex-col">
            <h3 class="mb-2.5 text-xl font-playfair text-color-black">Swimming Pool & Spa</h3>
            <p class="text-color-gold text-sm mb-2.5"><i class="fas fa-tag"></i> Facilities</p>
            <p class="text-gray-600 mb-4 leading-relaxed flex-grow">Enjoy our world-class swimming pool and spa facilities, featuring an infinity pool overlooking the city skyline...</p>
            <div class="flex justify-between text-gray-400 text-xs mb-4">
              <span><i class="fas fa-calendar-alt"></i> Updated: 12 Jun 2023</span>
              <span><i class="fas fa-eye"></i> 958 views</span>
            </div>
            <div class="flex gap-2.5 justify-end">
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-black cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">
                <i class="fas fa-eye"></i>
              </button>
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-black cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">
                <i class="fas fa-edit"></i>
              </button>
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-danger cursor-pointer transition-all hover:bg-[rgba(244,67,54,0.1)] flex items-center justify-center">
                <i class="fas fa-trash-alt"></i>
              </button>
            </div>
          </div>
        </div>

        <!-- Card 3 -->
        <div class="bg-color-white rounded-md overflow-hidden shadow-sm transition-all hover:translate-y-[-5px] hover:shadow-lg h-full flex flex-col">
          <div class="h-[200px] bg-cover bg-center relative" style="background-image: url('https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80');">
            <span class="absolute top-4 right-4 py-1 px-2.5 rounded-full text-xs font-medium bg-color-success text-white">Published</span>
          </div>
          <div class="p-5 flex-grow flex flex-col">
            <h3 class="mb-2.5 text-xl font-playfair text-color-black">Fine Dining Experience</h3>
            <p class="text-color-gold text-sm mb-2.5"><i class="fas fa-tag"></i> Services</p>
            <p class="text-gray-600 mb-4 leading-relaxed flex-grow">Our award-winning restaurant offers a sophisticated fine dining experience with a menu crafted by Michelin-starred chefs...</p>
            <div class="flex justify-between text-gray-400 text-xs mb-4">
              <span><i class="fas fa-calendar-alt"></i> Updated: 18 Jun 2023</span>
              <span><i class="fas fa-eye"></i> 875 views</span>
            </div>
            <div class="flex gap-2.5 justify-end">
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-black cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">
                <i class="fas fa-eye"></i>
              </button>
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-black cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">
                <i class="fas fa-edit"></i>
              </button>
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-danger cursor-pointer transition-all hover:bg-[rgba(244,67,54,0.1)] flex items-center justify-center">
                <i class="fas fa-trash-alt"></i>
              </button>
            </div>
          </div>
        </div>

        <!-- Card 4 -->
        <div class="bg-color-white rounded-md overflow-hidden shadow-sm transition-all hover:translate-y-[-5px] hover:shadow-lg h-full flex flex-col">
          <div class="h-[200px] bg-cover bg-center relative" style="background-image: url('https://images.unsplash.com/photo-1574691250077-03a929faece5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80');">
            <span class="absolute top-4 right-4 py-1 px-2.5 rounded-full text-xs font-medium bg-color-info text-white">Draft</span>
          </div>
          <div class="p-5 flex-grow flex flex-col">
            <h3 class="mb-2.5 text-xl font-playfair text-color-black">Conference Facilities</h3>
            <p class="text-color-gold text-sm mb-2.5"><i class="fas fa-tag"></i> Facilities</p>
            <p class="text-gray-600 mb-4 leading-relaxed flex-grow">Host your next business meeting or conference in our state-of-the-art facilities equipped with the latest technology...</p>
            <div class="flex justify-between text-gray-400 text-xs mb-4">
              <span><i class="fas fa-calendar-alt"></i> Updated: 25 Jun 2023</span>
              <span><i class="fas fa-eye"></i> 430 views</span>
            </div>
            <div class="flex gap-2.5 justify-end">
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-black cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">
                <i class="fas fa-eye"></i>
              </button>
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-black cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">
                <i class="fas fa-edit"></i>
              </button>
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-danger cursor-pointer transition-all hover:bg-[rgba(244,67,54,0.1)] flex items-center justify-center">
                <i class="fas fa-trash-alt"></i>
              </button>
            </div>
          </div>
        </div>

        <!-- Card 5 -->
        <div class="bg-color-white rounded-md overflow-hidden shadow-sm transition-all hover:translate-y-[-5px] hover:shadow-lg h-full flex flex-col">
          <div class="h-[200px] bg-cover bg-center relative" style="background-image: url('https://images.unsplash.com/photo-1519690889869-e705e59f72e1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80');">
            <span class="absolute top-4 right-4 py-1 px-2.5 rounded-full text-xs font-medium bg-color-warning text-white">Archived</span>
          </div>
          <div class="p-5 flex-grow flex flex-col">
            <h3 class="mb-2.5 text-xl font-playfair text-color-black">Hotel History</h3>
            <p class="text-color-gold text-sm mb-2.5"><i class="fas fa-tag"></i> History</p>
            <p class="text-gray-600 mb-4 leading-relaxed flex-grow">Established in 1975, Vista Hotel has a rich history of providing exceptional luxury accommodation for over 45 years...</p>
            <div class="flex justify-between text-gray-400 text-xs mb-4">
              <span><i class="fas fa-calendar-alt"></i> Updated: 03 May 2023</span>
              <span><i class="fas fa-eye"></i> 612 views</span>
            </div>
            <div class="flex gap-2.5 justify-end">
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-black cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">
                <i class="fas fa-eye"></i>
              </button>
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-black cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">
                <i class="fas fa-edit"></i>
              </button>
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-danger cursor-pointer transition-all hover:bg-[rgba(244,67,54,0.1)] flex items-center justify-center">
                <i class="fas fa-trash-alt"></i>
              </button>
            </div>
          </div>
        </div>

        <!-- Card 6 -->
        <div class="bg-color-white rounded-md overflow-hidden shadow-sm transition-all hover:translate-y-[-5px] hover:shadow-lg h-full flex flex-col">
          <div class="h-[200px] bg-cover bg-center relative" style="background-image: url('https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80');">
            <span class="absolute top-4 right-4 py-1 px-2.5 rounded-full text-xs font-medium bg-color-success text-white">Published</span>
          </div>
          <div class="p-5 flex-grow flex flex-col">
            <h3 class="mb-2.5 text-xl font-playfair text-color-black">Awards & Recognition</h3>
            <p class="text-color-gold text-sm mb-2.5"><i class="fas fa-tag"></i> Awards</p>
            <p class="text-gray-600 mb-4 leading-relaxed flex-grow">Vista Hotel has received numerous awards for excellence in hospitality, including the prestigious Five Diamond Award...</p>
            <div class="flex justify-between text-gray-400 text-xs mb-4">
              <span><i class="fas fa-calendar-alt"></i> Updated: 22 Jun 2023</span>
              <span><i class="fas fa-eye"></i> 745 views</span>
            </div>
            <div class="flex gap-2.5 justify-end">
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-black cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">
                <i class="fas fa-eye"></i>
              </button>
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-black cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">
                <i class="fas fa-edit"></i>
              </button>
              <button class="w-8 h-8 rounded-full border-none bg-color-light text-color-danger cursor-pointer transition-all hover:bg-[rgba(244,67,54,0.1)] flex items-center justify-center">
                <i class="fas fa-trash-alt"></i>
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Pagination -->
      <div class="flex justify-center gap-1 mt-8">
        <button class="w-9 h-9 rounded border border-color-cream bg-color-white cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">
          <i class="fas fa-angle-left"></i>
        </button>
        <button class="w-9 h-9 rounded border border-color-cream bg-color-gold text-white cursor-pointer flex items-center justify-center">1</button>
        <button class="w-9 h-9 rounded border border-color-cream bg-color-white cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">2</button>
        <button class="w-9 h-9 rounded border border-color-cream bg-color-white cursor-pointer transition-all hover:bg-color-cream flex items-center justify-center">
          <i class="fas fa-angle-right"></i>
        </button>
      </div>
    </div>
  </main>
</div>

<!-- Modal for Add Information -->
<div id="addInfoModal" class="fixed top-0 left-0 right-0 bottom-0 hidden z-[1001] overflow-y-auto">
  <div class="bg-color-white max-w-[900px] my-8 mx-auto rounded-md shadow-lg relative animate-modalFadeIn max-h-[90vh] overflow-y-auto">
    <div class="p-5 border-b border-color-cream flex justify-between items-center sticky top-0 bg-color-white z-10">
      <h2 class="m-0 text-2xl font-playfair text-color-black">Add New Information</h2>
      <button class="bg-none border-none text-2xl leading-none cursor-pointer text-gray-400 hover:text-color-black transition-all" id="closeModal">&times;</button>
    </div>

    <div class="p-6">
      <form class="add-form" id="addInfoForm">
        <!-- Basic Information Section -->
        <div class="mb-8 border-b border-color-cream pb-5">
          <h3 class="mb-4 text-lg font-playfair">Basic Information</h3>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
            <div class="col-span-full">
              <label for="title" class="block mb-2 font-medium">Title*</label>
              <input type="text" id="title" name="title" placeholder="Enter title" required
                     class="w-full p-3 border border-color-cream rounded bg-color-white outline-none transition-all focus:border-color-gold focus:shadow">
            </div>
            <div>
              <label for="category" class="block mb-2 font-medium">Category*</label>
              <select id="category" name="category" required
                      class="w-full p-3 border border-color-cream rounded bg-color-white outline-none transition-all focus:border-color-gold">
                <option value="">Select Category</option>
                <option value="about">About Us</option>
                <option value="facilities">Facilities</option>
                <option value="services">Services</option>
                <option value="history">History</option>
                <option value="awards">Awards</option>
                <option value="other">Other</option>
              </select>
            </div>
            <div>
              <label for="status" class="block mb-2 font-medium">Status*</label>
              <select id="status" name="status" required
                      class="w-full p-3 border border-color-cream rounded bg-color-white outline-none transition-all focus:border-color-gold">
                <option value="published">Published</option>
                <option value="draft">Draft</option>
                <option value="archived">Archived</option>
              </select>
            </div>
          </div>
        </div>

        <!-- Content Section -->
        <div class="mb-8 border-b border-color-cream pb-5">
          <h3 class="mb-4 text-lg font-playfair">Content</h3>
          <div>
            <label for="shortDescription" class="block mb-2 font-medium">Short Description*</label>
            <textarea id="shortDescription" name="shortDescription" rows="3"
                      placeholder="Brief summary (150-200 characters)" required
                      class="w-full p-3 border border-color-cream rounded bg-color-white outline-none transition-all focus:border-color-gold focus:shadow"></textarea>
            <div class="text-right text-xs text-gray-400 mt-1">
              <span id="shortDescCounter">0</span>/200 characters
            </div>
          </div>
          <div class="mt-4">
            <label for="content" class="block mb-2 font-medium">Full Content*</label>
            <textarea id="content" name="content" rows="10"
                      class="w-full p-3 border border-color-cream rounded bg-color-white outline-none transition-all focus:border-color-gold focus:shadow"></textarea>
          </div>
        </div>

        <!-- Featured Image Section -->
        <div class="mb-8 border-b border-color-cream pb-5">
          <h3 class="mb-4 text-lg font-playfair">Featured Image</h3>
          <div class="w-full">
            <div class="border-2 border-dashed border-color-cream rounded-md p-10 text-center cursor-pointer transition-all hover:border-color-gold">
              <i class="fas fa-cloud-upload-alt text-4xl text-color-gold mb-2.5"></i>
              <p>Drag & drop featured image here or click to browse</p>
              <p class="text-xs text-gray-400 mt-1">Recommended size: 1200x800px, max 2MB</p>
              <input type="file" id="featuredImage" name="featuredImage" accept="image/*" class="hidden">
            </div>
            <div id="featuredImagePreview" class="flex flex-wrap gap-4 mt-5">
              <!-- Preview image will be displayed here -->
            </div>
          </div>
        </div>

        <!-- Gallery Images Section -->
        <div class="mb-8 border-b border-color-cream pb-5">
          <h3 class="mb-4 text-lg font-playfair">Gallery Images</h3>
          <div class="w-full">
            <div class="border-2 border-dashed border-color-cream rounded-md p-10 text-center cursor-pointer transition-all hover:border-color-gold">
              <i class="fas fa-images text-4xl text-color-gold mb-2.5"></i>
              <p>Drag & drop gallery images here or click to browse</p>
              <p class="text-xs text-gray-400 mt-1">Up to 10 images, max 2MB each</p>
              <input type="file" id="galleryImages" name="galleryImages" multiple accept="image/*" class="hidden">
            </div>
            <div id="galleryPreview" class="flex flex-wrap gap-2.5 mt-5">
              <!-- Preview images will be displayed here -->
            </div>
          </div>
        </div>

        <!-- SEO Settings Section -->
        <div class="mb-8">
          <h3 class="mb-4 text-lg font-playfair">SEO Settings</h3>
          <div class="grid grid-cols-1 gap-4">
            <div>
              <label for="metaTitle" class="block mb-2 font-medium">Meta Title</label>
              <input type="text" id="metaTitle" name="metaTitle" placeholder="Title for search engines"
                     class="w-full p-3 border border-color-cream rounded bg-color-white outline-none transition-all focus:border-color-gold focus:shadow">
            </div>
            <div>
              <label for="metaDescription" class="block mb-2 font-medium">Meta Description</label>
              <textarea id="metaDescription" name="metaDescription" rows="3" placeholder="Description for search engines"
                        class="w-full p-3 border border-color-cream rounded bg-color-white outline-none transition-all focus:border-color-gold focus:shadow"></textarea>
              <div class="text-right text-xs text-gray-400 mt-1">
                <span id="metaDescCounter">0</span>/160 characters
              </div>
            </div>
            <div>
              <label for="keywords" class="block mb-2 font-medium">Keywords</label>
              <input type="text" id="keywords" name="keywords" placeholder="Comma separated keywords"
                     class="w-full p-3 border border-color-cream rounded bg-color-white outline-none transition-all focus:border-color-gold focus:shadow">
            </div>
          </div>
        </div>

        <!-- Form Actions -->
        <div class="flex justify-end gap-4 mt-8">
          <button type="button" id="cancelAddInfo" class="px-6 py-3 bg-transparent border border-color-cream rounded-md text-color-black transition-all hover:bg-color-light font-medium">
            Cancel
          </button>
          <button type="button" id="saveDraft" class="px-6 py-3 bg-color-light border border-color-cream rounded-md text-color-black transition-all hover:bg-color-cream font-medium">
            Save as Draft
          </button>
          <button type="submit" class="px-6 py-3 bg-color-gold text-white border-none rounded-md cursor-pointer transition-all hover:bg-opacity-90 font-medium">
            Publish Information
          </button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Modal Overlay -->
<div id="modalOverlay" class="fixed top-0 left-0 right-0 bottom-0 bg-black bg-opacity-60 z-[1000] hidden"></div>

<!-- TinyMCE Script -->
<script src="https://cdn.tiny.cloud/1/your-api-key/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const openAddInfoModal = () => {
      document.getElementById('addInfoModal').classList.remove('hidden');
      document.getElementById('modalOverlay').classList.remove('hidden');
      document.body.style.overflow = 'hidden';

      // Initialize TinyMCE
      tinymce.init({
        selector: '#content',
        plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
        toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
        height: 300,
        content_style: 'body { font-family: Poppins, sans-serif; font-size: 14px; }',
        images_upload_handler: function (blobInfo, success, failure) {
          const reader = new FileReader();
          reader.onload = function () {
            success(reader.result);
          };
          reader.readAsDataURL(blobInfo.blob());
        }
      });
    };

    const closeAddInfoModal = () => {
      document.getElementById('addInfoModal').classList.add('hidden');
      document.getElementById('modalOverlay').classList.add('hidden');
      document.body.style.overflow = '';

      if (tinymce.get('content')) {
        tinymce.remove('#content');
      }
    };

    const featuredImageInput = document.getElementById('featuredImage');
    const featuredImagePreview = document.getElementById('featuredImagePreview');
    const uploadBox = document.querySelector('.image-upload-box');

    uploadBox.addEventListener('click', () => featuredImageInput.click());

    featuredImageInput.addEventListener('change', function() {
      if (this.files && this.files[0]) {
        const reader = new FileReader();

        reader.onload = function(e) {
          featuredImagePreview.innerHTML = `
                            <div class="relative">
                                <img src="${e.target.result}" alt="Preview" class="w-40 h-40 object-cover rounded">
                                <button type="button" class="absolute top-2 right-2 bg-black bg-opacity-50 text-white border-none w-6 h-6 rounded-full flex items-center justify-center text-xs cursor-pointer hover:bg-opacity-80">×</button>
                            </div>
                        `;
        };

        reader.readAsDataURL(this.files[0]);
      }
    });

    const galleryImagesInput = document.getElementById('galleryImages');
    const galleryPreview = document.getElementById('galleryPreview');
    const galleryUploadBox = document.querySelectorAll('.image-upload-box')[1];

    galleryUploadBox.addEventListener('click', () => galleryImagesInput.click());

    galleryImagesInput.addEventListener('change', function() {
      if (this.files) {
        for (let i = 0; i < this.files.length; i++) {
          const reader = new FileReader();

          reader.onload = function(e) {
            const div = document.createElement('div');
            div.className = 'relative';
            div.innerHTML = `
                                <img src="${e.target.result}" alt="Gallery image" class="w-24 h-24 object-cover rounded">
                                <button type="button" class="absolute top-2 right-2 bg-black bg-opacity-50 text-white border-none w-5 h-5 rounded-full flex items-center justify-center text-xs cursor-pointer hover:bg-opacity-80">×</button>
                            `;
            galleryPreview.appendChild(div);
          };

          reader.readAsDataURL(this.files[i]);
        }
      }
    });

    const shortDescInput = document.getElementById('shortDescription');
    const shortDescCounter = document.getElementById('shortDescCounter');

    shortDescInput.addEventListener('input', function() {
      const count = this.value.length;
      shortDescCounter.textContent = count;
      if (count > 200) {
        shortDescCounter.classList.add('text-red-500');
      } else {
        shortDescCounter.classList.remove('text-red-500');
      }
    });

    const metaDescInput = document.getElementById('metaDescription');
    const metaDescCounter = document.getElementById('metaDescCounter');

    metaDescInput.addEventListener('input', function() {
      const count = this.value.length;
      metaDescCounter.textContent = count;
      if (count > 160) {
        metaDescCounter.classList.add('text-red-500');
      } else {
        metaDescCounter.classList.remove('text-red-500');
      }
    });

    document.getElementById('addInfoForm').addEventListener('submit', function(e) {
      e.preventDefault();

      const successMessage = document.createElement('div');
      successMessage.className = 'flex items-center gap-2.5 bg-color-success bg-opacity-10 text-color-success p-4 rounded-md mb-5';
      successMessage.innerHTML = `
                    <i class="fas fa-check-circle text-2xl"></i>
                    <span>Information added successfully!</span>
                `;

      const form = document.getElementById('addInfoForm');
      form.insertBefore(successMessage, form.firstChild);

      setTimeout(() => {
        closeAddInfoModal();
      }, 1500);
    });

    document.getElementById('saveDraft').addEventListener('click', function() {
      document.getElementById('status').value = 'draft';
      document.getElementById('addInfoForm').dispatchEvent(new Event('submit'));
    });

    document.querySelector('.btn-add').addEventListener('click', openAddInfoModal);
    document.getElementById('closeModal').addEventListener('click', closeAddInfoModal);
    document.getElementById('cancelAddInfo').addEventListener('click', closeAddInfoModal);
    document.getElementById('modalOverlay').addEventListener('click', closeAddInfoModal);

    document.querySelector('#addInfoModal > div').addEventListener('click', e => e.stopPropagation());

    if (!document.getElementById('tailwind-animations')) {
      const style = document.createElement('style');
      style.id = 'tailwind-animations';
      style.textContent = `
                    @keyframes modalFadeIn {
                        from { opacity: 0; transform: translateY(-20px); }
                        to { opacity: 1; transform: translateY(0); }
                    }
                    .animate-modalFadeIn {
                        animation: modalFadeIn 0.3s;
                    }
                `;
      document.head.appendChild(style);
    }
  });
</script>