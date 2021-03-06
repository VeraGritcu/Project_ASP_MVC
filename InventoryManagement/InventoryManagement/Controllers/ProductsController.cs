﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DataAccess;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace InventoryManagement.Controllers
{
    public class ProductsController : Controller
    {
        private readonly WarehouseContext _context;
        public ProductsController(WarehouseContext context)
        {
            this._context = context;
        }
        public IActionResult Index(int? categoryID)
        {
            List<Products> produse;

            if (categoryID.HasValue)
            {
                produse = _context.Products.Include(p => p.Category)
                    .Where(p=>p.Category.Id == categoryID).ToList();
            }
            else
            {
                produse = _context.Products.Include(p => p.Category).ToList();
            }

            ViewData["Mesaj"] = "Aveti in baza de date " + produse.Count + " produse";

            return View(produse);
        }

        // GET: Products1/Edit/5
        public ActionResult<Products> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var products = _context.Products.Find(id);

            if (products == null)
            {
                return NotFound();
            }
            var allCategories = this._context.Category.ToList();

            this.ViewBag.Categories = allCategories;
            return View(products);
        }

        // POST: Products1/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Products product)
        {
            if (id != product.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(product);

                    _context.Entry(product.Category).State = EntityState.Unchanged;

                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductsExists(product.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            var allCategories = this._context.Category.ToList();

            this.ViewBag.Categories = allCategories;

            return View(product);
        }

        private bool ProductsExists(int id)
        {
            return _context.Products.Any(e => e.Id == id);
        }

        [HttpGet]
        public IActionResult Create()
        {
            var allCategories = this._context.Category.ToList();

            this.ViewBag.Categories = allCategories;

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Products product)
        {
            if (ModelState.IsValid)
            {
                _context.Add(product);

                _context.Entry(product.Category).State = EntityState.Unchanged;

                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            else
            {
                var allCategories = this._context.Category.ToList();
                this.ViewBag.Categories = allCategories;
            }

            return View(product);
        }

        public IActionResult Details(int id)
        {
            var product = _context.Products.FirstOrDefault(p => p.Id == id);

            if (product == null)
            {
                return NotFound();
            }
            var allCategories = this._context.Category.ToList();

            this.ViewBag.Categories = allCategories;

            return View(product);
        }

        [HttpGet]
        public IActionResult Delete(int id)
        {
            var product = _context.Products.FirstOrDefault(p => p.Id == id);

            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            var product = _context.Products.FirstOrDefault(p => p.Id == id);

            if (product == null)
            {
                return NotFound();
            }

            _context.Products.Remove(product);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

    }
}