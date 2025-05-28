var v=Object.defineProperty;var b=(p,t,e)=>t in p?v(p,t,{enumerable:!0,configurable:!0,writable:!0,value:e}):p[t]=e;var c=(p,t,e)=>b(p,typeof t!="symbol"?t+"":t,e);import{getUserSession as f}from"../auth.js";import{getProducts as x,getProductByID as I}from"../product/core.js";import{calculateTransaction as C}from"../calculation/transaction.js";import{formatPrice as u}from"../helper.js";import w from"../transaction/core.js";import{toast as d}from"../helper/config.js";class D{constructor(t){c(this,"debounceTimer",0);c(this,"cartManager");c(this,"handleDate",()=>{const t=document.querySelectorAll(".date-time");if(!t.length)return;const e=new Date().toISOString().split("T")[0];t.forEach(n=>n.textContent=e)});c(this,"bindAddToCartBtn",()=>{const t=document.querySelectorAll(".box-search-products-addcart");console.log("Bind Add To Cart Button..."),t.forEach(e=>{e.addEventListener("click",async n=>{n.preventDefault(),console.log("Add Cart clicked...");const r=e.closest("tr").dataset.id;console.log("Add Cart clicked, ID:",r),await I(Number(r)).then(o=>{this.cartManager.addItem(o),this.renderInterface()})})})});c(this,"renderInterface",()=>{console.log("Update Cart Display...");const t=document.getElementById("cart-items"),e=document.getElementById("cart-sub-total"),n=document.getElementById("cart-total"),a=document.getElementById("cart-total-discount"),r=document.getElementById("cart-total-tax"),o=document.getElementById("cart-total-item"),i=this.cartManager.getCart();if(console.log("Carts : ",i),i.items.length===0){t.innerHTML='<p style="width:100%;text-align:center">Keranjang kosong</p>',n.textContent="Rp0",a.textContent="Rp0",e.textContent="Rp0",r.textContent="Rp0",o.textContent="0";return}t&&(t.innerHTML=i.items.map(s=>`
            <tr class="cart-item" data-id="${s.id}">
                <td class="d-xl-table-cell">${s.barcode}</td>
                <td class="item-name">${s.name}</td>

                <td class="item-quantity  d-xl-table-cell">
                    <div class="d-flex gap-2">
                        <button type="button" class="qty-minus btn btn-secondary px-1">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-minus">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                            </svg>
                        </button>
                        <input class="input-qty" type="number"
                            style="background-color:transparent;border:none;outline:none;font-size:1.2rem;width:20px;"
                            value="${s.quantity}"></input>
                        <button type="button" class="qty-plus btn btn-secondary px-1">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-plus">
                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                            </svg>
                        </button>
                    </div>
                </td>
                <td class="item-price  d-xl-table-cell">${u(s.price)}</td>
                <td class=" d-md-table-cell">${s.discount*100}%</td>
                <td class="item-price  d-xl-table-cell">${u((s.price-s.price*s.discount)*s.quantity)}</td>
                <td class="table-action d-xl-table-cell d-flex flex-wrap gap-2 justify-content-center align-items-center">
                    <button type="button" class="item-remove btn btn-secondary my-1" style="text-decoration: none;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" style="width:1rem;height:1rem;"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round" class="feather feather-trash-2">
                            <polyline points="3 6 5 6 21 6"></polyline>
                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                            <line x1="10" y1="11" x2="10" y2="17"></line>
                            <line x1="14" y1="11" x2="14" y2="17"></line>
                        </svg>
                    </button>
                </td>
            </tr>
        `).join(""),n.textContent=u(i.total),a.textContent=u(i.total_discount),e.textContent=u(i.subtotal),r.textContent=u(i.tax),o.textContent=i.total_item.toString(),document.querySelectorAll(".qty-minus").forEach(s=>{s.removeEventListener("click",this.handleDecreaseQty),s.addEventListener("click",this.handleDecreaseQty)}),document.querySelectorAll(".qty-plus").forEach(s=>{s.removeEventListener("click",this.handleIncreaseQty),s.addEventListener("click",this.handleIncreaseQty)}),document.querySelectorAll(".item-remove").forEach(s=>{s.removeEventListener("click",this.handleRemoveItem),s.addEventListener("click",this.handleRemoveItem)}),document.querySelectorAll(".input-qty").forEach(s=>{s.removeEventListener("change",this.handleQuantityChange),s.addEventListener("change",this.handleQuantityChange)}))});c(this,"addToCart",async(t,e)=>{t.preventDefault(),console.log("Add To Cart...");const n=document.getElementById(e);try{const r=(await this.cartManager.fetchByName(n.value)).data;console.log("Found Product by Name : ",r);const o={...r,cost_price:Number(r.cost_price),price:Number(r.price),discount:Number(r.discount),tax_rate:Number(r.tax_rate),quantity:1};n.value="",this.cartManager.addItem(o),this.renderInterface(),d({message:`${r.name} ditambahkan ke keranjang`,type:"success"})}catch(a){console.log("addToCart error: ",a),d({message:"Something Wrong",type:"error"})}});c(this,"printStruct",async t=>{console.log("Print Struct : ",{carts:t});const e=document.createElement("div");e.id="receipt",e.style.display="none";const n=new Date,a=n.toISOString().split("T")[0],r=n.toTimeString().split(" ")[0],o=await f();console.log("Cashier : ",o);let i=`
            <div style="font-family: monospace; font-size: 20px; padding: 10px;">
                <div style="text-align: center;">
                    <strong>Abya's DevStore</strong><br>
                    Jl. Kartini Mojokerep, Plemahan<br>
                    Kabupaten Kediri<br>
                    No. Telp 0812345678<br>
                    16413520230802084636
                </div>
                <hr>
                <div style="display: flex; justify-content: space-between;">
                    <div>${a}<br>${r}</div>
                    <div style="text-align: end;">
                        Kasir<br>
                        ${o.name}<br>
                    </div>
                </div>
                <br>Products<br>
                <hr>
            `,s=1,m=0;i+=t.items.map(l=>{const h=l.quantity,y=l.price*h;return m+=h,`
                <div style="margin-bottom: 15px;">
                    <strong>${s++}. ${l.name}</strong>
                    <div style="display:flex;justify-content:space-between;">
                        <div style="margin-left: 30px;">${h} x Rp ${l.price.toLocaleString("id-ID")}</div>
                        <div>Rp ${y.toLocaleString("id-ID")}</div>
                    </div>
                </div>
            `}).join("<br>"),i+=`
            <hr>
            <div>Total QTY : ${m}</div>
            <br>
            <div style="display: flex; justify-content: space-between;">
                <span>Sub Total</span>
                <span>${t.subtotal.toLocaleString("id-ID")}</span>
            </div>
            <div style="display: flex; justify-content: space-between;">
                <span>Total Tax</span>
                <span>${t.tax.toLocaleString("id-ID")}</span>
            </div>
            <div style="display: flex; justify-content: space-between;">
                <span>Total Discount</span>
                <span>${t.total_discount.toLocaleString("id-ID")}</span>
            </div>
            <div style="display: flex; justify-content: space-between;">
                <strong>Total</strong>
                <strong>${t.total.toLocaleString("id-ID")}</strong>
            </div>
            <div style="display: flex; justify-content: space-between;">
                <span>Bayar (Cash)</span>
                <span>${t.pay_received.toLocaleString("id-ID")}</span>
            </div>
            <div style="display: flex; justify-content: space-between;">
                <span>Kembali</span>
                <span>${t.pay_return.toLocaleString("id-ID")}</span>
            </div>
            <br>
            <div style="text-align: center;">Terimakasih Telah Berbelanja</div>
            <br>
            <div style="font-size: 10px; text-align: center;">
                Link Kritik dan Saran:<br>
                com/e-receipt/S-00D39U-07G344G
            </div>
            </div>
        `,e.innerHTML=i,document.body.appendChild(e);const g=document.createElement("style");g.textContent=`
            @media print {
                body * {
                    visibility: hidden !important;
                }
                #receipt, #receipt * {
                    visibility: visible !important;
                }
                #receipt {
                    position: absolute;
                    left: 0;
                    top: 0;
                    width: 100%;
                    padding: 10px;
                }
            }
        `,document.head.appendChild(g),e.style.display="block",setTimeout(()=>{console.log("Start Print..."),window.print(),e.remove(),g.remove()},200)});c(this,"handleAddNotes",t=>{const e=t.target;this.cartManager.setNotes(e.value)});c(this,"handleSaveTransaction",async t=>{var r;t.preventDefault(),console.log("Masuk handleSaveTransaction...");const e=this.cartManager.getCart();console.log("Transaksi at state ",e);const n=document.getElementById("pay-transaction"),a=parseInt(n.value);if(this.cartManager.isEmptyCart())d({message:"Keranjang masih kosong",type:"warning",position:"center"});else if(a)if(a<e.total){d({message:"Jumlah Pembayaran kurang.",type:"warning"});return}else{const o=C(e);console.log("Result of calculation transaction ",o);const i=await w.insert(o);(r=i==null?void 0:i.data)!=null&&r.transaction_id?(d({message:"Transaksi berhasil disimpan",type:"success"}),n.value="",this.cartManager.clearCart(),this.renderInterface()):d({message:"Transaksi gagal disimpan",type:"error"})}else{d({message:"Jumlah pembayaran tidak boleh kosong.",type:"warning"});return}});c(this,"handleQuantityChange",t=>{const e=t.target,n=parseInt(e.value),a=e.closest(".cart-item");a||console.error("Item element not found.");const r=parseInt((a==null?void 0:a.dataset.id)||"0");console.log("Finding cart with id",r);const i=this.cartManager.getCart().items.find(s=>s.id===r);if(console.log("Found item",i),isNaN(n)||n<1){d({message:"Jumlah tidak boleh kosong atau kurang dari 1",type:"warning"}),e.value="1";return}this.cartManager.updateQuantity(r,n),this.renderInterface()});c(this,"handlePrintStruct",t=>{t.preventDefault(),console.log("Masuk handlePrintStruct...");const e=this.cartManager.getCart();this.printStruct(e)});c(this,"hanldeAddToCartBox",t=>{this.addToCart(t,"bx-search-products")});c(this,"hanldeAddToCartForm",t=>{this.addToCart(t,"fm-search-products")});c(this,"handleInputPay",t=>{console.log("Handle Input Pay...");const e=t.target,n=document.getElementById("return-transaction");clearTimeout(this.debounceTimer);const a=this.cartManager.getCart();this.debounceTimer=window.setTimeout(()=>{const r=parseFloat(e.value)||0,o=r-a.total,i=o>0?o:0;n.value=u(i),this.cartManager.setPayReceived(r),this.cartManager.setPayChange(o)},300)});c(this,"handleDecreaseQty",t=>{const n=t.target.closest(".cart-item");if(!n)return;const a=parseInt(n.dataset.id||"0"),o=this.cartManager.getCart().items.find(i=>i.id===a);o&&o.quantity>1?(this.cartManager.updateQuantity(a,o.quantity-1),this.renderInterface()):(d({message:"Product dihapus dari keranjang",type:"info"}),this.cartManager.removeItem(a),this.renderInterface())});c(this,"handleIncreaseQty",t=>{const n=t.target.closest(".cart-item");if(!n)return;const a=parseInt(n.dataset.id||"0");console.log("Finding cart with id",a);const o=this.cartManager.getCart().items.find(i=>i.id===a);console.log("Found item",o),o&&(this.cartManager.updateQuantity(a,o.quantity+1),this.renderInterface())});c(this,"handleRemoveItem",t=>{const n=t.target.closest(".cart-item");if(!n)return;const a=parseInt(n.dataset.id||"0");this.cartManager.removeItem(a),this.renderInterface()});c(this,"handleClearCart",t=>{t.preventDefault(),this.cartManager.clearCart(),this.renderInterface()});this.cartManager=t,this.bindEvents()}bindEvents(){console.log("Bind Events..."),this.renderInterface(),this.handleDate(),document.addEventListener("cartUpdated",this.renderInterface),document.getElementById("form-search-products").addEventListener("submit",this.hanldeAddToCartForm),document.getElementById("pay-transaction").addEventListener("input",this.handleInputPay),document.getElementById("cart-notes").addEventListener("input",this.handleAddNotes),document.getElementById("box-search-products").addEventListener("submit",this.hanldeAddToCartBox),document.getElementById("print-struct-btn").addEventListener("click",this.handlePrintStruct),document.getElementById("btn-save-transaction").addEventListener("click",this.handleSaveTransaction),document.getElementById("select-product-btn").addEventListener("click",async()=>{const m=document.getElementById("bx-table-search-product"),g=await x();m&&(m.innerHTML=g.map(l=>`
                <tr class="" data-id="${l.id}">
                    <td class="d-xl-table-cell">${l.barcode}</td>
                    <td class="d-xl-table-cell">${l.name}</td>
                    <td class="d-xl-table-cell">
                    <button class="btn btn-secondary box-search-products-addcart">
                        +
                    </button>
                    </td>
                </tr>
            `).join("")),setTimeout(()=>{this.bindAddToCartBtn()},900)}),document.getElementById("reset-cart-btn").addEventListener("click",this.handleClearCart)}}export{D as default};
